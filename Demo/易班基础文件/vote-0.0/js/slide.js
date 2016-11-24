var counter = 0;
var carousel = {
    name: null,
    speed: 1000,
    thumbName: null,
    stop: true,
    visible: 3
};

function id(name){
    return document.getElementById(name);
}

function count(){
    return $$$(id(carousel.name)).find("li").length;
}

function setCurrentCss(i){
    var ele = id(carousel.thumbName + i);
    var items = $$$(id(carousel.name)).find("li");
    for (var s = 1; s<=items.length; s++) {
	 if(s==i)
	 {
	    $$$(items[s-1]).find("img").css("opacity", "1");
	 }
	 else
	 {
            $$$(items[s-1]).find("img").css("opacity", "0.5");
	 }
    }
    $$$(id(carousel.name)).find(".current").removeClass("current");
    $$$(ele).addClass("current");
}

function auto(){
    counter++;
    if (carousel.stop) {
        doSlide(counter);
        
    }
    setTimeout(auto, carousel.speed);
}

function doSlide(i){
    var length = count();
    if (length > 0) {
        if (i > length) {
            i = 1;
        }
        else 
            if (i < 1) {
                i = length;
            }
        counter = i;
        var items = $$$(id(carousel.name)).find("li");
        if (i > carousel.visible) {
            for (var j = 0; j < i - carousel.visible; j++) {
                $$$(items[j]).hide();
            }
        }
        $$$(items[i - 1]).show();
        if (i == 1) {
            $$$(id(carousel.name)).find("li").show();
        }
        var o = id(carousel.name);
        setCurrentCss(i);
        $$$(o).find("#largeImage img").attr("src", $$$(items[i - 1]).find("img").attr("src"));
        $$$(o).find("#largeImage a").attr("title", $$$(items[i - 1]).find("img").attr("alt"));
        $$$(o).find("#largeImage a").attr("href", $$$(items[i - 1]).find("a").attr("href"));

        var test= $$$(items[i - 1]).find("img").attr("alt");

	if ( test != null){
           $$$(o).find(".word").css("opacity", "0.8");
	   $$$(o).find("#largeImage img").css("opacity", "1");
           $$$(o).find(".word").html($$$(items[i - 1]).find("img").attr("alt"));
	}
	else{
           $$$(o).find(".word").css("opacity", "0");
           $$$(o).find(".word").html(null);
	}
    }
}

$$$(function(){
    carousel.name = "slide";
    carousel.thumbName = "thumb_";
    carousel.speed = "3000";
    
    auto();
    $$$("#slideNext").click(function(){
        counter++;
        doSlide(counter);
        return false;
    });
    $$$("#slidePrev").click(function(){
        counter--;
        doSlide(counter);
        return false;
    });
    $$$(id(carousel.name)).find("ul a").click(function(){
        var i = $$$(this).find("span").text();
        doSlide(i);
        return false;
    });
    $$$(id(carousel.name)).find("ul a").hover(function(){
        var i = $$$(this).find("span").text();
		doSlide(i);
        carousel.stop = false;
    }, function(){
		var i = $$$(this).find("span").text();
        doSlide(i);
        carousel.stop = true;
    });
    var imageNum = 0;
    $$$(id(carousel.name)).find("#largeImage a").hover(function(){
        imageNum = counter;
        carousel.stop = false;
    }, function(){
        doSlide(imageNum);
        carousel.stop = true;
    });
});
