'use strict';
/*function count(){
	var arr=[];
	for(var i=1;i<=3;i++){
		arr.push((function(n){
			return function(){
				return n*n;
			}
		})(i));
	}
	return arr;
}
var results = count();
console.log(results);

var f1=results[0];

var f2=results[1];

var f3=results[2];

console.log(f1());

console.log(f2());

console.log(f3());*/
var obj={
	birth:1990,
	getAge:function(){
		var b=this.birth;
		var fn=()=>new Date().getFullYear()-this.birth;
		return fn();
	}
};
obj.getAge();