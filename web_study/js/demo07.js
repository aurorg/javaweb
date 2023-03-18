function getid(id){
    return document.getElementById(id);
}

window.onload=function(){

    updateZJ();
    //当页面加载完成时，需要绑定各种事件

    //根据表格获取到表格
    var fruitTbl = getid("tbl_fruit");

    //获取表格中的所有的行
    var rows=fruitTbl.rows;
    for(var i=1;i<rows.length-1;i++){
        var tr=rows[i];



    }

    getid("addBtn").onclick=addFruit;
}

function trBindEvent(tr){
    //1.绑定鼠标悬浮设置背景颜色事件
    tr.onmouseover=showBGColor;
    tr.onmouseout=clearBGColor; //离开

    var cells =tr.cells;
    var priceTD =cells[1];

    //2.绑定鼠标悬浮在单价单元格变手势的事件
    priceTD.onmouseover=showHand;

    //3.绑定鼠标点击单价单元格的事件
    priceTD.onclick=editPrice;

    //7.绑定删除小图标的点击事件
    var img=cells[4].firstChild;
    if(img && img.tagName=="IMG"){
        //绑定单击事件
        img.onclick=delFruit;
    }

}

//添加水果信息
function addFruit(){
    var fname=getid("fname").value;
    var price=parseInt(getid("price").value);
    var fcount=parseInt(getid("fcount").value);
    var xj=price*fcount;

    var fruitTbl=getid("tbl_fruit");
    var tr =fruitTbl.insertRow(fruitTbl.rows.length-1);

    var fnameTD=tr.insertCell();
    fnameTD.innerText=fname;

    var priceTD=tr.insertCell();
    priceTD.innerText=price;

    var fcountTD=tr.insertCell();
    fcountTD.innerText=fcount;

    var xjTD=tr.insertCell();
    xjTD.innerText=xj;

    var imgTD=tr.insertCell();
    imgTD.innerHTML="<img src=\"/pictures/1.jpg\" class=\"delImg\">";

    updateZJ();
}

function delFruit(){
    if( event  && event.srcElement && event.srcElement.tagName=="IMG"){
        //alter表示弹出一个对话框，只有确定按钮
        //confirm表示弹出一个对话框，有确定和取消按钮。当点击确定，返回true，否则返回false

        if(window.confirm("是否确认删除当前库存记录")){
            var img=event.srcElement;
            var tr=img.parentElement.parentElement;
            var fruitTbl =document.getElementById("tbl_fruit");
            fruitTbl.deleteRow(tr.rowIndex);

            updateZJ();
        }
    }
}

//当鼠标点击单价单元格时进行价格编辑
function editPrice(){
    if(event && event.srcElement && event.srcElement.tagName=="TD"){
        var priceTD=event.srcElement;

        //目的是判断当前priceTD有子节点，而且第一个子节点是文本节点，TextNode对应的是3，ElementNode对应的是1
        if(priceTD.firstChild && priceTD.firstChild.nodeType==3) {
            //innerText表示设置或者获取当前节点的内部文本
            var oldPrice = priceTD.innerHTML;


            //innerHTML 表示设置当前节点的内部HTML
            priceTD.innerHTML = "<input type='text' size='4'/>";

            //<td><input type='text' size='4' />;
            var input = priceTD.firstChild;
            if (input.tagName == "INPUT") {
                input.value = oldPrice;

                //选中输入框内部的文本
                input.select();

                //4.绑定输入框失去焦点事件，失去焦点，更新单价
                input.onblur=updatePrice;

                //8.在输入框上绑定键盘输入的事件，此处需要保证用户输入的是数字
                input.onkeydown=ckInput;

            }

        }

    }
}

//检验键盘输入的值的方法
function ckInput(){
    var kc=event.keyCode;
    //0-9：48-57
    //backspace:8
    //enter:13
    //console.log(kc);
      if( !((kc>=48 && kc<=57)  || kc==8 || kc==13 ) ){
          event.returnValue=false;
      }

      if(kc==13){
          event.srcElement.blur();
      }
}

//更新单价的方法
function updatePrice(){
    if(event && event.srcElement && event.srcElement.tagName=="INPUT"){
        var input=event.srcElement;
        var newPrice=input.value;

        //input的父节点是td
        var priceTD =input.parentElement;
        priceTD.innerText=newPrice;

        //5.更新当前这一行的小计这一个格子的值
        //priceTD.parentElement td的父元素是tr
        updateXJ(priceTD.parentElement);
    }
}

//更新指定行的小计
function updateXJ(tr){
    if(tr && tr.tagName=="TR"){
        var tds=tr.cells;
        var price =tds[1].innerText;
        var count =tds[2].innerText;

        //innerText获取到的值的类型是字符串类型，因此需要类型转换，才能进行数学运算
        var xj=parseInt(price) * parseInt(count);
        tds[3].innerText=xj;

        //6.更新总计
        updateZJ();
    }
}

function updateZJ(){
    var fruitTbl =document.getElementById("tbl_fruit");
    var rows =fruitTbl.rows;
    var sum=0;
    for(var i=1;i<rows.length-1;i++){
        var tr=rows[i];
        var xj=parseInt(tr.cells[3].innerText);
        sum=sum+xj;
    }
    rows[rows.length-1].cells[1].innerText=sum;
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

