$(function () {

var img=document.querySelectorAll('#exhibition img');
var list=document.querySelectorAll('#list li');
var index=0;
function change(){
    for(var i = 0;i<img.length;i++){
        img[i].style.opacity=0;
        list[i].style.opacity=1;
    }
    img[index].style.opacity=1;
    list[index].style.opacity=0.8;
}


for (var i= 0;i<list.length;i++ ) {
    list[i].num=i;
    list[i].onclick=function(){
        index=this.num;
        change();
    }
}
setInterval(A,3000)
function A(){
    change();
    index++;
    if(index==5){
        index=0;
    }
}

})