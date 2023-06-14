// 添加成绩
function addScore(student, chinese, math, english) {
    scoreList.push({
        student: student,
        chinese: chinese,
        math: math,
        english: english
    });
    saveStudentList();
    renderScoreList();
}

// 编辑成绩
function editScore(id, student, chinese, math, english) {
    const score = scoreList[id];
    if (score) {
        score.student = student;
        score.chinese = chinese;
        score.math = math;
        score.english = english;
        saveStudentList();
        renderScoreList();
    }
}

// 删除成绩
function deleteScore(id) {
    scoreList.splice(id, 1);
    saveStudentList();
    renderScoreList();
}

// 清空成绩表单
function clearScoreForm() {
    scoreForm.reset();
    document.querySelector('#score-id-input').value = '';
}

// 初始化学生下拉列表
function initStudentSelect() {
    let html = '<option value="">请选择</option>';
    studentList.forEach(student => {
        html += `<option value="${student.name}">${student.name}</option>`;
    });
    document.querySelector('#score-student-input').innerHTML = html;
}

// 初始化事件监听器
function initEventListeners() {
    // 学生表单提交事件
    studentForm.addEventListener('submit', event => {
        event.preventDefault();
        const id = document.querySelector('#id-input').value;
        const name = document.querySelector('#name-input').value;
        const age = document.querySelector('#age-input').value;
        const gender = document.querySelector('#gender-input').value;
        if (id) {
            editStudent(id, name, age, gender);
        } else {
            addStudent(name, age, gender);
        }
        clearStudentForm();
    });

    // 学生表格编辑和删除按钮事件
    studentTable.addEventListener('click', event => {
        const target = event.target;
        if (target.classList.contains('edit-btn')) {
            const id = target.dataset.id;
            const student = studentList[id];
            if (student) {
                document.querySelector('#id-input').value = id;
                document.querySelector('#name-input').value = student.name;
                document.querySelector('#age-input').value = student.age;
                document.querySelector('#gender-input').value = student.gender;
            }
        } else if (target.classList.contains('delete-btn')) {
            const id = target.dataset.id;
            deleteStudent(id);
        }
    });

    // 清空学生表单按钮事件
    clearBtn.addEventListener('click', event => {
        clearStudentForm();
    });

    // 成绩表单提交事件
    scoreForm.addEventListener('submit', event => {
        event.preventDefault();
        const id = document.querySelector('#score-id-input').value;
        const student = document.querySelector('#score-student-input').value;
        const chinese = document.querySelector('#score-chinese-input').value;
        const math = document.querySelector('#score-math-input').value;
        const english = document.querySelector('#score-english-input').value;
        if (id) {
            editScore(id, student, chinese, math, english);
        } else {
            addScore(student, chinese, math, english);
        }
        clearScoreForm();
    });

    // 成绩表格编辑和删除按钮事件
    scoreTable.addEventListener('click', event => {
        const target = event.target;
        if (target.classList.contains('edit-btn')) {
            const id = target.dataset.id;
            const score = scoreList[id];
            if (score) {
                document.querySelector('#score-id-input').value = id;
                document.querySelector('#score-student-input').value = score.student;
                document.querySelector('#score-chinese-input').value = score.chinese;
                document.querySelector('#score-math-input').value = score.math;
                document.querySelector('#score-english-input').value = score.english;
            }
        } else if (target.classList.contains('delete-btn')) {
            const id = target.dataset.id;
            deleteScore(id);
        }
    });

    // 清空成绩表单按钮事件
    scoreClearBtn.addEventListener('click', event => {
        clearScoreForm();
    });
}

// 初始化函数
function init() {
    getStudentList();
    renderStudentList();
    renderScoreList();
    initStudentSelect();
    initEventListeners();
}

// 调用初始化函数
init();