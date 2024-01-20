localStorage.setItem("toggleDark", "false");

let tableData = document.querySelectorAll('td');
const toDark = function() {
    for (let i = 0; i < tableData.length; i++) {
        tableData[i].style.backgroundColor = "black";
    }
}

let toggleDark = document.querySelector("#toggleEmoji");
toggleDark.addEventListener('click', function() {
    if (localStorage.getItem("toggleDark") === "false") {
        localStorage.setItem("toggleDark", "true")
        toggleDark.innerHTML = "🌙";
        toDark();
    }
    else {
        localStorage.setItem("toggleDark", "false")
        toggleDark.innerHTML = "☀️";
    }
})

let courseList = document.querySelectorAll('tbody tr');
for (let i = 0; i < courseList.length; i++) {
    courseList[i].addEventListener('click', function() {
        let courseNumber = this.querySelector('td:first-child').innerHTML;
        console.log(`User clicked ${courseNumber}`);
    })
}