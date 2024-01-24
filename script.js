// Session handlers for dark mode and the course display user interface.
sessionStorage.setItem("toggleDark", "false");
sessionStorage.setItem("openCourse", "false"); 
sessionStorage.setItem("adminScreen", "true"); 
sessionStorage.setItem("removingCourses", "false"); 
sessionStorage.setItem("addingCourses", "false"); 

// Functionality for the dark mode feature.
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
    document.querySelector(".footerSection").classList.toggle("darkMode");
    document.querySelector("#navBar").classList.toggle("darkMode");
    for (let i = 0; i < tableData.length; i++) {
        tableData[i].classList.toggle("darkMode");
    }
}

// Functionality for the scroll back to top button.
document.querySelector("#upButton").addEventListener("click", function() {
    window.scrollTo({top: 0, behavior: "smooth"});
})

// Functionality for the course display user interface.
let courseContainer = document.querySelector("#courseContainer");
let courseList = document.querySelectorAll(".springId, .fallId");
for (let i = 0; i < courseList.length; i++) {
    courseList[i].addEventListener('click', function () {
        let courseNumber = this.innerHTML;
        if (courseNumber === "" || courseNumber === "COSC XXX"|| courseNumber === "CORE" || this.innerHTML === "Semester Hours" || this.id === "emptyRow" || sessionStorage.getItem("adminScreen") === "true") {
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

// Loads all saved courses from the LocalStorage into the table.
let selectOptions = document.querySelectorAll("select");
function loadOptions() {
    for (let i = 0; i < selectOptions.length; i++) {
        if (localStorage.getItem(`${selectOptions[i].id}`) !== null) {
            console.log(`Loaded ${selectOptions[i].id} with ${localStorage.getItem(`${selectOptions[i].id}`)}`);
            selectOptions[i].value = localStorage.getItem(`${selectOptions[i].id}`);
            if (localStorage.getItem(`${selectOptions[i].id}`) === "none") {
                selectOptions[i].parentNode.parentNode.querySelector("td:first-child").textContent = "";
            }
            else if (localStorage.getItem(`${selectOptions[i].id}`) === "advanced") {
                selectOptions[i].parentNode.parentNode.querySelector("td:first-child").textContent = "COSC";
            }
            else if (localStorage.getItem(`${selectOptions[i].id}`) === "core") {
                selectOptions[i].parentNode.parentNode.querySelector("td:first-child").textContent = "CORE";
            }
            else {
                selectOptions[i].parentNode.parentNode.querySelector("td:first-child").textContent = `${localStorage.getItem(`${selectOptions[i].id}`)}`;
            }
        }
    }
    console.log("Finished loading!");
}
loadOptions();

// Places all chosen courses into an array and hides the options in the table.
const chosenClasses = [];
const hideTakenOptions = function() {
    for (let i = 0; i < selectOptions.length; i++) {
        if (selectOptions[i].value !== "none" && selectOptions[i].value !== "advanced" && selectOptions[i].value !== "core") {
            chosenClasses.push(selectOptions[i].value);
        }
    }
    
    let allOptions = document.querySelectorAll("option");
    for (let i = 0; i < allOptions.length; i++) {
        if (chosenClasses.includes(allOptions[i].value) && allOptions[i].parentNode.value !== allOptions[i].value) {
            allOptions[i].style.visibility = "hidden";
        }
    }
}

// Removes non-chosen courses from the array and reshows the options on the table.
const showUntakenOptions = function(courseValue) {
    let allOptions = document.querySelectorAll(`option[value="${courseValue}"]`);
    for (let i = 0; i < allOptions.length; i++) {
        const index = chosenClasses.indexOf(`${courseValue}`);
        chosenClasses.splice(index, 1);
        allOptions[i].style.visibility = "visible";
    }
}

// Functionality and event listener for course selection.
for (let i = 0; i < selectOptions.length; i++) {
    selectOptions[i].addEventListener("change", function() { // Updates the table with user's choice
        console.log(`Selected ${this.value}`);
        if (this.value === "none") {
            this.parentNode.parentNode.querySelector("td:first-child").textContent = "";
            showUntakenOptions(localStorage.getItem(`${this.id}`));
            localStorage.setItem(`${this.id}`, `${this.value}`);
            return;
        }
        else if (this.value === "advanced") {
            this.parentNode.parentNode.querySelector("td:first-child").textContent = "COSC XXX";
            showUntakenOptions(localStorage.getItem(`${this.id}`));
            localStorage.setItem(`${this.id}`, `${this.value}`);
            return;
        }
        else if (this.value === "core") {
            this.parentNode.parentNode.querySelector("td:first-child").textContent = "CORE";
            showUntakenOptions(localStorage.getItem(`${this.id}`));
            localStorage.setItem(`${this.id}`, `${this.value}`);
            return;
        }
        this.parentNode.parentNode.querySelector("td:first-child").textContent = this.value;
        showUntakenOptions(localStorage.getItem(`${this.id}`));
        localStorage.setItem(`${this.id}`, `${this.value}`);
        hideTakenOptions();
    })
}

$("#adminButton").on("click", function() {
    if (sessionStorage.getItem("adminScreen") === "true") { // off
        sessionStorage.setItem("adminScreen", "false"); 
    }
    else {
        sessionStorage.setItem("adminScreen", "true");  // on
    }
})

$("#removeButton").on("click", function() {
    if (sessionStorage.getItem("removingCourses") === "true") {
        sessionStorage.setItem("removingCourses", "false"); 
        this.textContent = "Remove";
        $(".fallId").off("click");
        $(".springId").off("click");
    }
    else {
        sessionStorage.setItem("removingCourses", "true");
        this.textContent = "REMOVING";
        $(".fallId").on("click", function() {
            console.log("course remove");
            this.textContent = "";
            this.parentNode.querySelector(".fallCourse").textContent = "";
            this.parentNode.querySelector(".fallHours").textContent = "0";
        })
        $(".springId").on("click", function() {
            console.log("course remove");
            this.textContent = "";
            this.parentNode.querySelector(".springCourse").textContent = "";
            this.parentNode.querySelector(".springHours").textContent = "0";
        })
    }
})

$("#addButton").on("click", function() {
    if (sessionStorage.getItem("addingCourses") === "true") {
        sessionStorage.setItem("addingCourses", "false"); 
        this.textContent = "Add";

        let selectedCourses = $('.fallId select');
        for (let i = 0; i < selectedCourses.length; i++) {
            console.log(selectedCourses[i].value);
            selectedCourses[i].parentNode.innerHTML = selectedCourses[i].value;
        }

    }
    else {
        sessionStorage.setItem("addingCourses", "true");
        this.textContent = "ADDING";
        const options = ["COSC 1336", "COSC 1437", "MATH 2414"];
        let fallCourses = $(".fallId");
        for (let i = 0; i < fallCourses.length; i++) {
            if (fallCourses[i].textContent === "") {
                const selectElement = document.createElement("select");
                options.forEach(optionText => {
                    const option = document.createElement("option");
                    option.value = optionText;
                    option.text = optionText;
                    selectElement.add(option);
                })
                fallCourses[i].appendChild(selectElement);
            }
        }
        let springCourses = $(".springId");
        for (let i = 0; i < springCourses.length; i++) {
            if (springCourses[i].textContent === "") {
                const selectElement = document.createElement("select");
                options.forEach(optionText => {
                    const option = document.createElement("option");
                    option.value = optionText;
                    option.text = optionText;
                    selectElement.add(option);
                })
                springCourses[i].appendChild(selectElement);
            }
        }

    }
})

// Clears the LocalStorage.
//localStorage.clear();