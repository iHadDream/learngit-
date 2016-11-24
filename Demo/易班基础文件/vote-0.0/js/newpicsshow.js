function shownewspic(pics,links,texts,width,height) {
     var focus_width = 420;
     if(typeof(width) != "undefined") {
　　     focus_width=width;
     }
     var focus_height=280;
     if(typeof(height)!="undefined") {
          focus_height=height;
     }
     var text_height=20;              
     var swf_height = focus_height+text_height; 
     
     document.write('<object classid="clsid:D27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
     document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="js/pixviewer.swf"><param name="quality" value="high"><param name="bgcolor" value="#ffffff">');
     document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
     document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
     document.write('<embed src="js/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#000000" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
  　	 document.write('</object>');        
}
