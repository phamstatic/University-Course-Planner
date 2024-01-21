sessionStorage.setItem("toggleDark", "false"); // Handler for Dark Mode
sessionStorage.setItem("openCourse", "false"); // Handler for Course Display

// Dark Mode Functionality
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


// Course Display Functionality
let courseContainer = document.querySelector("#courseContainer");
let courseList = document.querySelectorAll("tbody tr");
for (let i = 0; i < courseList.length; i++) {
    courseList[i].addEventListener('click', function () {
        let courseNumber = this.querySelector('td:first-child').innerHTML;
        if (courseNumber === "" || courseNumber === "COSC XXX") {
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

// Load Save Options From Local Storage
let selectOptions = document.querySelectorAll("select");
function loadOptions() {
    for (let i = 0; i < selectOptions.length; i++) {
        if (localStorage.getItem(`${selectOptions[i].id}`) !== null) {
            console.log(`Loaded ${selectOptions[i].id} with ${localStorage.getItem(`${selectOptions[i].id}`)}`);
            selectOptions[i].value = localStorage.getItem(`${selectOptions[i].id}`);
            if (localStorage.getItem(`${selectOptions[i].id}`) === "none") {
                selectOptions[i].parentNode.parentNode.querySelector("td:first-child").textContent = "";
            }
            else {
                selectOptions[i].parentNode.parentNode.querySelector("td:first-child").textContent = `${localStorage.getItem(`${selectOptions[i].id}`)}`;
            }
        }
    }
    console.log("Finished loading!");
}
loadOptions();

// Options Handler
const chosenClasses = [];
const hideTakenOptions = function() {
    for (let i = 0; i < selectOptions.length; i++) {
        if (selectOptions[i].value !== "none" && selectOptions[i].value !== "advanced") {
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

// Reshows the courses that are no longer chosen
const showUntakenOptions = function(courseValue) {
    let allOptions = document.querySelectorAll(`option[value="${courseValue}"]`);
    for (let i = 0; i < allOptions.length; i++) {
        const index = chosenClasses.indexOf(`${courseValue}`);
        chosenClasses.splice(index, 1);
        allOptions[i].style.visibility = "visible";
    }
}

// Select + Update Options Functionality
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
        this.parentNode.parentNode.querySelector("td:first-child").textContent = this.value;
        showUntakenOptions(localStorage.getItem(`${this.id}`));
        localStorage.setItem(`${this.id}`, `${this.value}`);
        hideTakenOptions();
    })
}

localStorage.clear();