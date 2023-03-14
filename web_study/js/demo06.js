
window.onload=function(){
    //当页面加载完成时，需要绑定各种事件

    //根据表格获取到表格
    var fruitTbl = document.getElementById("tbl_fruit");

    //获取表格中的所有的行
    var rows=fruitTbl.rows;
    for(var i=0;i<rows.length;i++){
        var tr=rows[i];

        //1.绑定鼠标悬浮设置背景颜色事件
        tr.onmouseover=showBGColor;
        tr.onmouseout=clearBGColor; //离开

        var cells =tr.cells;
        var priceTD =cells[1];

        //2.绑定鼠标悬浮在单价单元格变手势的事件
        priceTD.onmouseover=showHand;

        //3.绑定鼠标点击单价单元格的事件
       // priceTD.onclick=editPrice;
    }


}




//当鼠标悬浮式，显示背景颜色
function showBGColor(){
    //event:当前发生的事件
    //event.srcElement:事件源
    // alert(event.srcElement);
    // alert(event.srcElement.tagName); --TD

    if(event && event.srcElement && event.srcElement.tagName=="TD"){
        var td=event.srcElement;

        //td.parentElement 表示获取td的父元素 ->TR
        var tr=td.parentElement;

        //如果想要通过js代码设置某节点的样式，则需要加上.style
        tr.style.background="navy";

        //tr.cells表示获取这个tr中的所有的单元格

        var tds=tr.cells;
        for(var i=0;i<tds.length;i++){
            tds[i].style.color="white";
        }
    }

}


//当鼠标离开时，恢复原来的
function clearBGColor(){
    if(event && event.srcElement && event.srcElement.tagName=="TD"){
        var td=event.srcElement;
        var tr=td.parentElement;
        tr.style.backgroundColor="transparent";
        var tds=tr.cells;
        for(var i=0;i<tds.length;i++){
            tds[i].style.color="orange";
        }
    }
}

//当鼠标悬浮在单价单元格时，显示手势
function showHand(){
    if(event && event.srcElement && event.srcElement.tagName=="TD"){
        var td=event.srcElement;

        //cursor:光标
        td.style.cursor="pointer";
    }
}

