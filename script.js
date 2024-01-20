sessionStorage.setItem("toggleDark", "false");
sessionStorage.setItem("openCourse", "false");

let toggleDark = document.querySelector("#toggleEmoji");
let tableData = document.querySelectorAll("td");
toggleDark.addEventListener("click", function () {
    if (sessionStorage.getItem("toggleDark") === "false") {
        sessionStorage.setItem("toggleDark", "true")
        toggleDark.innerHTML = "🌙";
        toggleFunction();
    }
    else {
        sessionStorage.setItem("toggleDark", "false")
        toggleDark.innerHTML = "☀️";
        toggleFunction();
    }
})

const toggleFunction = function () {
    document.querySelector("body").classList.toggle("darkMode");
    for (let i = 0; i < tableData.length; i++) {
        tableData[i].classList.toggle("darkMode");
    }
}

let courseContainer = document.querySelector("#courseContainer");

let courseList = document.querySelectorAll("tbody tr");
for (let i = 0; i < courseList.length; i++) {
    courseList[i].addEventListener('click', function () {
        let courseNumber = this.querySelector('td:first-child').innerHTML;
        if (courseNumber == "") {
            //alert(this.tagName);
            return;
        }
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
        if (sessionStorage.getItem("openCourse") === "false") {
            sessionStorage.setItem("openCourse", "true");
            courseContainer.classList.toggle("fadeOut");
            courseContainer.classList.toggle("fadeIn");
            courseContainer.style.visibility = "visible";
        }
    })
}

let courseClose = document.querySelector("#courseClose");
courseClose.addEventListener("click", function () {
    if (sessionStorage.getItem("openCourse") === "true") {
        setTimeout(function () {
            courseContainer.style.visibility = "hidden";
        }, 1000)
        courseContainer.classList.toggle("fadeIn");
        courseContainer.classList.toggle("fadeOut");
        sessionStorage.setItem("openCourse", "false");
    }
})

let selectOptions = document.querySelectorAll("select");
for (let i = 0; i < selectOptions.length; i++) {
    selectOptions[i].addEventListener("change", function() {
        console.log(`Selected ${this.value}`);
        if (this.value === "none") {
            this.parentNode.parentNode.querySelector("td:first-child").textContent = "";
            return;
        }
        this.parentNode.parentNode.querySelector("td:first-child").textContent = this.value;
    })
}