localStorage.setItem("toggleDark", "false");
localStorage.setItem("openCourse", "false");

let toggleDark = document.querySelector("#toggleEmoji");
let tableData = document.querySelectorAll("td");
toggleDark.addEventListener("click", function () {
    if (localStorage.getItem("toggleDark") === "false") {
        localStorage.setItem("toggleDark", "true")
        toggleDark.innerHTML = "🌙";
        toggleFunction();
    }
    else {
        localStorage.setItem("toggleDark", "false")
        toggleDark.innerHTML = "☀️";
        toggleFunction();
    }
})

const toggleFunction = function () {
    document.querySelector("body").classList.toggle("darkMode");
    for (let i = 0; i < tableData.length; i++) {
        tableData[i].classList.toggle("darkMode");    }
}

let courseContainer = document.querySelector("#courseContainer");

let courseList = document.querySelectorAll("tbody tr");
for (let i = 0; i < courseList.length; i++) {
    courseList[i].addEventListener('click', function () {
        let courseNumber = this.querySelector('td:first-child').innerHTML;
        console.log(`User clicked ${courseNumber}`);
        fetch("classes.json")
            .then(res => res.json())
            .then(json => {
                console.log(json[`${courseNumber}`].courseName);
                document.querySelector("#courseName").textContent = `${courseNumber}, ${json[`${courseNumber}`].courseName}`; 
                document.querySelector("#courseHours").textContent = json[`${courseNumber}`].courseHours; 
                document.querySelector("#courseCredits").textContent = json[`${courseNumber}`].courseCredits; 
                document.querySelector("#coursePrerequisite").textContent = json[`${courseNumber}`].coursePrerequisite; 
                document.querySelector("#courseDescription").textContent = json[`${courseNumber}`].courseDescription; 
                document.querySelector("#courseRepeatability").textContent = json[`${courseNumber}`].courseRepeatability;
                document.querySelector("#courseCore").textContent = json[`${courseNumber}`].courseCore;  
                document.querySelector("#courseFee").textContent = json[`${courseNumber}`].courseFee;  
                return json;
            });
            if (localStorage.getItem("openCourse") === "false") {
                localStorage.setItem("openCourse", "true");
                courseContainer.classList.toggle("fadeOut");
                courseContainer.classList.toggle("fadeIn");
                courseContainer.style.visibility = "visible";
            }
    })
}

let courseClose = document.querySelector("#courseClose");
courseClose.addEventListener("click", function () {
    if (localStorage.getItem("openCourse") === "true") {
        setTimeout(function () {
            courseContainer.style.visibility = "hidden";
        }, 1000)
        courseContainer.classList.toggle("fadeIn");
        courseContainer.classList.toggle("fadeOut");
        localStorage.setItem("openCourse", "false");
    }
})