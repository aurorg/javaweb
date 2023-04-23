function addStudent() {
    var table = document.getElementById("tbl_student");
    var row = table.insertRow(-1);

    var cell = row.insertCell(0);
    var input = document.createElement("input");
    input.type = "text";
    input.placeholder = "请输入学号";
    cell.appendChild(input);

    var cell = row.insertCell(1);
    var input = document.createElement("input");
    input.type = "text";
    input.placeholder = "请输入姓名";
    cell.appendChild(input);

    var cell = row.insertCell(2);
    var input = document.createElement("input");
    input.type = "text";
    input.placeholder = "请输入性别";
    cell.appendChild(input);

    var cell = row.insertCell(3);
    var input = document.createElement("input");
    input.type = "text";
    input.placeholder = "请输入年龄";
    cell.appendChild(input);

    var cell = row.insertCell(4);
    var btn_save = document.createElement("button");
    btn_save.type = "button";
    btn_save.innerHTML = "保存";
    btn_save.onclick = function() {
        saveNewStudent(row);
    };
    cell.appendChild(btn_save);

    var btn_cancel = document.createElement("button");
    btn_cancel.type = "button";
    btn_cancel.innerHTML = "取消";
    btn_cancel.onclick = function() {
        cancelNewStudent(row);
    };
    cell.appendChild(btn_cancel);
}

function saveNewStudent(row) {
    var cells = row.getElementsByTagName("td");

    for (var i = 0; i < cells.length - 1; i++) {
        var cell = cells[i];

        if (cell.firstChild.nodeName == "INPUT") {
            var value = cell.firstChild.value.trim();
            cell.innerHTML = value;
        }
    }

    var btn_edit = document.createElement("button");
    btn_edit.type = "button";
    btn_edit.innerHTML = "编辑";
    btn_edit.onclick = function() {
        editStudent(btn_edit);
    };

    var btn_delete = document.createElement("button");
    btn_delete.type = "button";
    btn_delete.innerHTML = "删除";
    btn_delete.onclick = function() {
        deleteStudent(btn_delete);
    };

    var cell = cells[cells.length - 1];
    cell.innerHTML = "";
    cell.appendChild(btn_edit);
    cell.innerHTML += " *~* ";
    cell.appendChild(btn_delete);
}

function cancelNewStudent(row) {
    row.parentNode.removeChild(row);
}

function editStudent(btn) {
    var row = btn.parentNode.parentNode;
    var cells = row.getElementsByTagName("td");

    for (var i = 0; i < cells.length - 1; i++) {
        var cell = cells[i];

        if (cell.firstChild.nodeType == 3) {
            var value = cell.innerHTML;

            cell.innerHTML = "";
            var input = document.createElement("input");
            input.type = "text";
            input.value = value.trim();
            cell.appendChild(input);
        }
    }

    btn.innerHTML = "保存";
    btn.onclick = function() {
        saveStudent(btn);
    };
}

function saveStudent(btn) {
    var row = btn.parentNode.parentNode;
    var cells = row.getElementsByTagName("td");

        for (var i = 0; i < cells.length - 1; i++) {
        var cell = cells[i];

        if (cell.firstChild.nodeName == "INPUT") {
            var value = cell.firstChild.value.trim();
            cell.innerHTML = value;
        }
    }

    btn.innerHTML = "编辑";
    btn.onclick = function() {
        editStudent(btn);
    };
}

function deleteStudent(btn) {
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
}