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

function addCourse() {
    // 创建一个新的行
    var newRow = document.createElement("tr");

    // 创建课程编号单元格
    var newIdCell = document.createElement("td");
    var newIdInput = document.createElement("input");
    newIdInput.type = "text";
    newIdInput.className = "form-control";
    newIdInput.placeholder = "请输入课程编号";
    newIdCell.appendChild(newIdInput);
    newRow.appendChild(newIdCell);

    // 创建课程名称单元格
    var newNameCell = document.createElement("td");
    var newNameInput = document.createElement("input");
    newNameInput.type = "text";
    newNameInput.className = "form-control";
    newNameInput.placeholder = "请输入课程名称";
    newNameCell.appendChild(newNameInput);
    newRow.appendChild(newNameCell);

    // 创建学分单元格
    var newCreditCell = document.createElement("td");
    var newCreditInput = document.createElement("input");
    newCreditInput.type = "text";
    newCreditInput.className = "form-control";
    newCreditInput.placeholder = "请输入学分";
    newCreditCell.appendChild(newCreditInput);
    newRow.appendChild(newCreditCell);

    // 创建操作单元格
    var newActionCell = document.createElement("td");
    var newSaveButton = document.createElement("button");
    newSaveButton.type = "button";
    newSaveButton.className = "btn btn-primary";
    newSaveButton.innerHTML = "保存";
    newSaveButton.onclick = function() {
        saveNewCourse(newRow);
    };
    newActionCell.appendChild(newSaveButton);

    var newCancelButton = document.createElement("button");
    newCancelButton.type = "button";
    newCancelButton.className = "btn btn-secondary";
    newCancelButton.innerHTML = "取消";
    newCancelButton.onclick = function() {
        cancelNewCourse(newRow);
    };
    newActionCell.appendChild(newCancelButton);

    newRow.appendChild(newActionCell);

    // 将新行添加到表格的末尾
    var table = document.getElementById("tbl_course");
    table.tBodies[0].appendChild(newRow);
}

function saveNewCourse(row) {
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
    btn_edit.className = "btn btn-primary";
    btn_edit.innerHTML = "编辑";
    btn_edit.onclick = function() {
        editCourse(btn_edit);
    };

    var btn_delete = document.createElement("button");
    btn_delete.type = "button";
    btn_delete.className = "btn btn-danger";
    btn_delete.innerHTML = "删除";
    btn_delete.onclick = function() {
        deleteCourse(btn_delete);
    };

    var cell = cells[cells.length - 1];
    cell.innerHTML = "";
    cell.appendChild(btn_edit);
    cell.innerHTML += " *~* ";
    cell.appendChild(btn_delete);
}

function cancelNewCourse(row) {
    row.parentNode.removeChild(row);
}

function editCourse(btn) {
    // 获取要编辑的行
    var row = btn.parentNode.parentNode;

    // 将行中的文本单元格替换为文本框
    var cells = row.cells;
    for (var i = 0; i < cells.length - 1; i++) {
        var input = document.createElement("input");
        input.type = "text";
        input.className = "form-control";
        input.value = cells[i].innerHTML;
        cells[i].innerHTML = "";
        cells[i].appendChild(input);
    }

    // 将编辑按钮替换为保存按钮
    btn.innerHTML = "保存";
    btn.className = "btn btn-primary";
    btn.onclick = function() {
        saveCourse(row);
    };
}

function saveCourse(row) {
    // 获取单元格中的文本框
    var cells = row.cells;
    var idInput = cells[0].querySelector("input");
    var nameInput = cells[1].querySelector("input");
    var creditInput = cells[2].querySelector("input");

    // 将文本框中的值保存到单元格中
    cells[0].innerHTML = idInput.value;
    cells[1].innerHTML = nameInput.value;
    cells[2].innerHTML = creditInput.value;

    // 将保存按钮替换为编辑和删除按钮
    var editButton = document.createElement("button");
    editButton.type = "button";
    editButton.className = "btn btn-primary";
    editButton.innerHTML = "编辑";
    editButton.onclick = function() {
        editCourse(editButton);
    };
    cells[3].innerHTML = "";
    cells[3].appendChild(editButton);
    cells[3].innerHTML += " *~* ";

    var deleteButton = document.createElement("button");
    deleteButton.type = "button";
    deleteButton.className = "btn btn-danger";
    deleteButton.innerHTML = "删除";
    deleteButton.onclick = function() {
        deleteCourse(deleteButton);
    };
    cells[3].appendChild(deleteButton);
}

function deleteCourse(btn) {
    // 获取要删除的行
    var row = btn.parentNode.parentNode;

    // 从表格中移除行
    var table = document.getElementById("tbl_course");
    table.tBodies[0].removeChild(row);
}