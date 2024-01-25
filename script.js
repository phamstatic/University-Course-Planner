// Session handlers for dark mode and the course display user interface.
sessionStorage.setItem("toggleDark", "false");
sessionStorage.setItem("openCourse", "false");
sessionStorage.setItem("newOpenCourse", "false");
sessionStorage.setItem("editingCourses", "false");
sessionStorage.setItem("adminScreen", "false");
sessionStorage.setItem("removingCourses", "false");
sessionStorage.setItem("addingCourses", "false");

// Functionality to count the total hours for each semester.
let updateTotalHours = function () {
    let totalFallHours = document.querySelectorAll(".fallTotal");
    for (let i = 0; i < totalFallHours.length; i++) {
        let totalHours = parseInt("0", 10);
        let courseHours = totalFallHours[i].parentNode.parentNode.parentNode.querySelectorAll(".fallHours");
        for (let j = 0; j < courseHours.length; j++) {
            totalHours += parseInt(courseHours[j].textContent, 10);
        }
        totalFallHours[i].textContent = totalHours;
    }
    let totalSpringHours = document.querySelectorAll(".springTotal");
    for (let i = 0; i < totalSpringHours.length; i++) {
        let totalHours = parseInt("0", 10);
        let courseHours = totalSpringHours[i].parentNode.parentNode.parentNode.querySelectorAll(".springHours");
        for (let j = 0; j < courseHours.length; j++) {
            totalHours += parseInt(courseHours[j].textContent, 10);
        }
        totalSpringHours[i].textContent = totalHours;
    }
}

// jsonFetch for first time loading
if (localStorage.getItem("classList") === null) { 
    fetch("classes.json")
        .then(res => res.json())
        .then(jsonData => {
            localStorage.setItem("classList", JSON.stringify(jsonData));
            console.log("Loaded premade courses and saved to LocalStorage.");

            localStorage.setItem("Year1Fall1", "COSC 1336");
            localStorage.setItem("Year1Fall2", "ENGL 1301");
            localStorage.setItem("Year1Fall3", "HIST 1377");
            localStorage.setItem("Year1Fall4", "GOVT 2306");
            localStorage.setItem("Year1Fall5", "MATH 2413");
    
            localStorage.setItem("Year1Spring1", "COSC 1437");
            localStorage.setItem("Year1Spring2", "ENGL 1302");
            localStorage.setItem("Year1Spring3", "HIST 1378");
            localStorage.setItem("Year1Spring4", "GOVT 2305");
            localStorage.setItem("Year1Spring5", "MATH 2414");
    
            localStorage.setItem("Year2Fall1", "COSC 2436");
            localStorage.setItem("Year2Fall2", "");
            localStorage.setItem("Year2Fall3", "");
            localStorage.setItem("Year2Fall4", "");
            localStorage.setItem("Year2Fall5", "");
            localStorage.setItem("Year2Fall6", "");
    
            localStorage.setItem("Year2Spring1", "COSC 2425");
            localStorage.setItem("Year2Spring2", "COSC 3360");
            localStorage.setItem("Year2Spring3", "");
            localStorage.setItem("Year2Spring4", "");
            localStorage.setItem("Year2Spring5", "");
            localStorage.setItem("Year2Spring6", "");
    
            localStorage.setItem("Year3Fall1", "COSC 3340");
            localStorage.setItem("Year3Fall2", "");
            localStorage.setItem("Year3Fall3", "MATH 3339");
            localStorage.setItem("Year3Fall4", "");
            localStorage.setItem("Year3Fall5", "");
    
            localStorage.setItem("Year3Spring1", "COSC 3380");
            localStorage.setItem("Year3Spring2", "");
            localStorage.setItem("Year3Spring3", "");
            localStorage.setItem("Year3Spring4", "");
            localStorage.setItem("Year3Spring5", "");
    
            localStorage.setItem("Year4Fall1", "");
            localStorage.setItem("Year4Fall2", "");
            localStorage.setItem("Year4Fall3", "");
            localStorage.setItem("Year4Fall4", "");
            localStorage.setItem("Year4Fall5", "");
    
            localStorage.setItem("Year4Spring1", "");
            localStorage.setItem("Year4Spring2", "");
            localStorage.setItem("Year4Spring3", "");
            localStorage.setItem("Year4Spring4", "");
            localStorage.setItem("Year4Spring5", "");
    
        });
}

console.log(JSON.parse(localStorage.getItem("classList")));

// Functionality to save course positions.
let saveCourses = function () {

    localStorage.setItem("Year1Fall1", document.querySelector(".Year1Fall1").textContent);
    localStorage.setItem("Year1Fall2", document.querySelector(".Year1Fall2").textContent);
    localStorage.setItem("Year1Fall3", document.querySelector(".Year1Fall3").textContent);
    localStorage.setItem("Year1Fall4", document.querySelector(".Year1Fall4").textContent);
    localStorage.setItem("Year1Fall5", document.querySelector(".Year1Fall5").textContent);

    localStorage.setItem("Year1Spring1", document.querySelector(".Year1Spring1").textContent);
    localStorage.setItem("Year1Spring2", document.querySelector(".Year1Spring2").textContent);
    localStorage.setItem("Year1Spring3", document.querySelector(".Year1Spring3").textContent);
    localStorage.setItem("Year1Spring4", document.querySelector(".Year1Spring4").textContent);
    localStorage.setItem("Year1Spring5", document.querySelector(".Year1Spring5").textContent);

    localStorage.setItem("Year2Fall1", document.querySelector(".Year2Fall1").textContent);
    localStorage.setItem("Year2Fall2", document.querySelector(".Year2Fall2").textContent);
    localStorage.setItem("Year2Fall3", document.querySelector(".Year2Fall3").textContent);
    localStorage.setItem("Year2Fall4", document.querySelector(".Year2Fall4").textContent);
    localStorage.setItem("Year2Fall5", document.querySelector(".Year2Fall5").textContent);
    localStorage.setItem("Year2Fall6", document.querySelector(".Year2Fall6").textContent);

    localStorage.setItem("Year2Spring1", document.querySelector(".Year2Spring1").textContent);
    localStorage.setItem("Year2Spring2", document.querySelector(".Year2Spring2").textContent);
    localStorage.setItem("Year2Spring3", document.querySelector(".Year2Spring3").textContent);
    localStorage.setItem("Year2Spring4", document.querySelector(".Year2Spring4").textContent);
    localStorage.setItem("Year2Spring5", document.querySelector(".Year2Spring5").textContent);
    localStorage.setItem("Year2Spring6", document.querySelector(".Year2Spring6").textContent);

    localStorage.setItem("Year3Fall1", document.querySelector(".Year3Fall1").textContent);
    localStorage.setItem("Year3Fall2", document.querySelector(".Year3Fall2").textContent);
    localStorage.setItem("Year3Fall3", document.querySelector(".Year3Fall3").textContent);
    localStorage.setItem("Year3Fall4", document.querySelector(".Year3Fall4").textContent);
    localStorage.setItem("Year3Fall5", document.querySelector(".Year3Fall5").textContent);

    localStorage.setItem("Year3Spring1", document.querySelector(".Year3Spring1").textContent);
    localStorage.setItem("Year3Spring2", document.querySelector(".Year3Spring2").textContent);
    localStorage.setItem("Year3Spring3", document.querySelector(".Year3Spring3").textContent);
    localStorage.setItem("Year3Spring4", document.querySelector(".Year3Spring4").textContent);
    localStorage.setItem("Year3Spring5", document.querySelector(".Year3Spring5").textContent);

    localStorage.setItem("Year4Fall1", document.querySelector(".Year4Fall1").textContent);
    localStorage.setItem("Year4Fall2", document.querySelector(".Year4Fall2").textContent);
    localStorage.setItem("Year4Fall3", document.querySelector(".Year4Fall3").textContent);
    localStorage.setItem("Year4Fall4", document.querySelector(".Year4Fall4").textContent);
    localStorage.setItem("Year4Fall5", document.querySelector(".Year4Fall5").textContent);

    localStorage.setItem("Year4Spring1", document.querySelector(".Year4Spring1").textContent);
    localStorage.setItem("Year4Spring2", document.querySelector(".Year4Spring2").textContent);
    localStorage.setItem("Year4Spring3", document.querySelector(".Year4Spring3").textContent);
    localStorage.setItem("Year4Spring4", document.querySelector(".Year4Spring4").textContent);
    localStorage.setItem("Year4Spring5", document.querySelector(".Year4Spring5").textContent);

}

let loadClassInformation = function () {
    let thisCourse = JSON.parse(localStorage.getItem("classList"));

    let selectFallHours = document.querySelectorAll(".fallHours");
    for (let i = 0; i < selectFallHours.length; i++) {
        if (selectFallHours[i].parentNode.querySelector(".fallId").textContent === "") {
            selectFallHours[i].parentNode.querySelector(".fallCourse").textContent = "";
            selectFallHours[i].textContent = "0";   
        }
        else {
            selectFallHours[i].parentNode.querySelector(".fallCourse").textContent = thisCourse[selectFallHours[i].parentNode.querySelector(".fallId").textContent].courseName;
            selectFallHours[i].textContent = thisCourse[selectFallHours[i].parentNode.querySelector(".fallId").textContent].courseCredits;    
        }
    } 

    let selectSpringHours = document.querySelectorAll(".springHours");
    for (let i = 0; i < selectSpringHours.length; i++) {
        if (selectSpringHours[i].parentNode.querySelector(".springId").textContent === "") {
            selectSpringHours[i].parentNode.querySelector(".springCourse").textContent = "";
            selectSpringHours[i].textContent = "0";   
        }
        else {
            selectSpringHours[i].parentNode.querySelector(".springCourse").textContent = thisCourse[selectSpringHours[i].parentNode.querySelector(".springId").textContent].courseName;
            selectSpringHours[i].textContent = thisCourse[selectSpringHours[i].parentNode.querySelector(".springId").textContent].courseCredits;    
        }
    } 

}

let loadCourses = function () {
    document.querySelector(".Year1Fall1").textContent = localStorage.getItem("Year1Fall1");
    document.querySelector(".Year1Fall2").textContent = localStorage.getItem("Year1Fall2");
    document.querySelector(".Year1Fall3").textContent = localStorage.getItem("Year1Fall3");
    document.querySelector(".Year1Fall4").textContent = localStorage.getItem("Year1Fall4");
    document.querySelector(".Year1Fall5").textContent = localStorage.getItem("Year1Fall5");

    document.querySelector(".Year1Spring1").textContent = localStorage.getItem("Year1Spring1");
    document.querySelector(".Year1Spring2").textContent = localStorage.getItem("Year1Spring2");
    document.querySelector(".Year1Spring3").textContent = localStorage.getItem("Year1Spring3");
    document.querySelector(".Year1Spring4").textContent = localStorage.getItem("Year1Spring4");
    document.querySelector(".Year1Spring5").textContent = localStorage.getItem("Year1Spring5");

    document.querySelector(".Year2Fall1").textContent = localStorage.getItem("Year2Fall1");
    document.querySelector(".Year2Fall2").textContent = localStorage.getItem("Year2Fall2");
    document.querySelector(".Year2Fall3").textContent = localStorage.getItem("Year2Fall3");
    document.querySelector(".Year2Fall4").textContent = localStorage.getItem("Year2Fall4");
    document.querySelector(".Year2Fall5").textContent = localStorage.getItem("Year2Fall5");
    document.querySelector(".Year2Fall6").textContent = localStorage.getItem("Year2Fall5");

    document.querySelector(".Year2Spring1").textContent = localStorage.getItem("Year2Spring1");
    document.querySelector(".Year2Spring2").textContent = localStorage.getItem("Year2Spring2");
    document.querySelector(".Year2Spring3").textContent = localStorage.getItem("Year2Spring3");
    document.querySelector(".Year2Spring4").textContent = localStorage.getItem("Year2Spring4");
    document.querySelector(".Year2Spring5").textContent = localStorage.getItem("Year2Spring5");
    document.querySelector(".Year2Spring6").textContent = localStorage.getItem("Year2Spring6");

    document.querySelector(".Year3Fall1").textContent = localStorage.getItem("Year3Fall1");
    document.querySelector(".Year3Fall2").textContent = localStorage.getItem("Year3Fall2");
    document.querySelector(".Year3Fall3").textContent = localStorage.getItem("Year3Fall3");
    document.querySelector(".Year3Fall4").textContent = localStorage.getItem("Year3Fall4");
    document.querySelector(".Year3Fall5").textContent = localStorage.getItem("Year3Fall5");

    document.querySelector(".Year3Spring1").textContent = localStorage.getItem("Year3Spring1");
    document.querySelector(".Year3Spring2").textContent = localStorage.getItem("Year3Spring2");
    document.querySelector(".Year3Spring3").textContent = localStorage.getItem("Year3Spring3");
    document.querySelector(".Year3Spring4").textContent = localStorage.getItem("Year3Spring4");
    document.querySelector(".Year3Spring5").textContent = localStorage.getItem("Year3Spring5");

    document.querySelector(".Year4Fall1").textContent = localStorage.getItem("Year4Fall1");
    document.querySelector(".Year4Fall2").textContent = localStorage.getItem("Year4Fall2");
    document.querySelector(".Year4Fall3").textContent = localStorage.getItem("Year4Fall3");
    document.querySelector(".Year4Fall4").textContent = localStorage.getItem("Year4Fall4");
    document.querySelector(".Year4Fall5").textContent = localStorage.getItem("Year4Fall5");

    document.querySelector(".Year4Spring1").textContent = localStorage.getItem("Year4Spring1");
    document.querySelector(".Year4Spring2").textContent = localStorage.getItem("Year4Spring2");
    document.querySelector(".Year4Spring3").textContent = localStorage.getItem("Year4Spring3");
    document.querySelector(".Year4Spring4").textContent = localStorage.getItem("Year4Spring4");
    document.querySelector(".Year4Spring5").textContent = localStorage.getItem("Year4Spring5");

    loadClassInformation();
    updateTotalHours();
}

loadCourses();

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
document.querySelector("#upButton").addEventListener("click", function () {
    window.scrollTo({ top: 0, behavior: "smooth" });
})

// Functionality for the course display user interface.
let courseContainer = document.querySelector("#courseContainer");
let courseList = document.querySelectorAll(".springId, .fallId");
for (let i = 0; i < courseList.length; i++) {
    courseList[i].addEventListener('click', function () {
        let courseNumber = this.innerHTML;
        if (courseNumber === "" || courseNumber === "COSC XXX" || courseNumber === "CORE" || this.innerHTML === "Semester Hours" || this.id === "emptyRow" || sessionStorage.getItem("adminScreen") === "true") {
            return;
        }
        let thisCourse = JSON.parse(localStorage.getItem("classList"))[`${courseNumber}`];
        document.querySelector("#courseName").textContent = `${thisCourse.courseName}`;
        document.querySelector("#courseHours").textContent = thisCourse.courseHours;
        document.querySelector("#courseCredits").textContent = thisCourse.courseCredits;
        document.querySelector("#coursePrerequisite").textContent = thisCourse.coursePrerequisite;
        document.querySelector("#courseDescription").textContent = thisCourse.courseDescription;
        document.querySelector("#courseRepeatability").textContent = thisCourse.courseRepeatability;
        document.querySelector("#courseCore").textContent = thisCourse.courseCore;
        document.querySelector("#courseFee").textContent = thisCourse.courseFee;
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

// Functionality to add a new course.
$("#newCourseSubmitButton").on("click", function () {
    let loadCourseList = JSON.parse(localStorage.getItem("classList"));
    loadCourseList[`${document.querySelector("#newCourseId").value}`] = {
        "courseName": `${document.querySelector("#newCourseName").value}`,
        "courseHours": `${document.querySelector("#newCourseId").value}`,
        "courseCredits": `${document.querySelector("#newCourseCredits").value}`,
        "coursePrerequisite": `${document.querySelector("#newCoursePrerequisites").value}`,
        "courseDescription": `${document.querySelector("#newCourseDescription").value}`,
        "courseRepeatability": `${document.querySelector("#newCourseRepeatability").value}`,
        "courseCore": `${document.querySelector("#newCourseCore").value}`,
        "courseFee": `${document.querySelector("#newCourseFee").value}`
    }
    localStorage.setItem("classList", JSON.stringify(loadCourseList));
    newCourseContainer.classList.toggle("fadeIn");
    newCourseContainer.classList.toggle("fadeOut");
})

let newCourseClose = document.querySelector("#newCourseClose");
let newCourseContainer = document.querySelector("#newCourseContainer");
newCourseClose.addEventListener("click", function () {
    if (sessionStorage.getItem("newOpenCourse") === "true") {
        setTimeout(function () {
            newCourseContainer.style.visibility = "hidden";
        }, 1000)
        newCourseContainer.classList.toggle("fadeIn");
        newCourseContainer.classList.toggle("fadeOut");
        sessionStorage.setItem("newOpenCourse", "false");
    }
})

// Loads all saved courses from the LocalStorage into the table.
let selectOptions = document.querySelectorAll("tbody select");
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
const hideTakenOptions = function () {
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
const showUntakenOptions = function (courseValue) {
    let allOptions = document.querySelectorAll(`option[value="${courseValue}"]`);
    for (let i = 0; i < allOptions.length; i++) {
        const index = chosenClasses.indexOf(`${courseValue}`);
        chosenClasses.splice(index, 1);
        allOptions[i].style.visibility = "visible";
    }
}

// Functionality and event listener for course selection.
for (let i = 0; i < selectOptions.length; i++) {
    selectOptions[i].addEventListener("change", function () { // Updates the table with user's choice
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

// Functionality for administrative buttons. 
$("#adminButton").on("click", function () {
    if (sessionStorage.getItem("adminScreen") === "true") { // off
        if (sessionStorage.getItem("addingCourses") === "true") {
            alert("Finish adding courses first!");
        }
        else if (sessionStorage.getItem("editingCourses") === "true") {
            alert("Finish editing courses first!");
        }
        else if (sessionStorage.getItem("removingCourses") === "true") {
            alert("Finish removing courses first!");
        }
        else {
            sessionStorage.setItem("adminScreen", "false");
            $("#adminButton").css("font-weight", "");
            document.querySelector("#addButton").style.visibility = "hidden";
            document.querySelector("#editButton").style.visibility = "hidden";
            document.querySelector("#removeButton").style.visibility = "hidden";
            document.querySelector("#newCourseButton").style.visibility = "hidden";
            saveCourses();
        }
    }
    else {
        sessionStorage.setItem("adminScreen", "true");  // on
        $("#adminButton").css("font-weight", "bold");
        document.querySelector("#addButton").style.visibility = "visible";
        document.querySelector("#editButton").style.visibility = "visible";
        document.querySelector("#removeButton").style.visibility = "visible";
        document.querySelector("#newCourseButton").style.visibility = "visible";
    }
})

$("#newCourseButton").on("click", function () {
    if (sessionStorage.getItem("newOpenCourse") === "false") {
        sessionStorage.setItem("newOpenCourse", "true");
        newCourseContainer.classList.toggle("fadeOut");
        newCourseContainer.classList.toggle("fadeIn");
        newCourseContainer.style.visibility = "visible";
    }
    else {
        sessionStorage.getItem("newOpenCourse") === "false"
        newCourseContainer.classList.toggle("fadeOut");
        newCourseContainer.classList.toggle("fadeIn");
        newCourseContainer.style.visibility = "visible";
    }
})

let editCourseContainer = document.querySelector("#editCourseContainer");
$("#editButton").on("click", function () {
    if (sessionStorage.getItem("editingCourses") === "false") {
        sessionStorage.setItem("editingCourses", "true");
        editCourseContainer.classList.toggle("fadeOut");
        editCourseContainer.classList.toggle("fadeIn");
        editCourseContainer.style.visibility = "visible";

        const options = [""];
        let thisCourse = JSON.parse(localStorage.getItem("classList"));
        for (let course in thisCourse) {
            if (thisCourse.hasOwnProperty(course)) {
                options.push(course);
            }
        }
        options.sort();

        let selectCourseToEdit = document.querySelector("#selectCourseToEdit");
        options.forEach(optionText => {
            const option = document.createElement("option");
            option.value = optionText;
            option.text = optionText;
            selectCourseToEdit.add(option);
        })

        selectCourseToEdit.addEventListener("change", function () {
            $("#editCourseName").attr("value", `${JSON.parse(localStorage.getItem("classList"))[this.value].courseName}`);
            $("#editCourseCredits").attr("value", `${JSON.parse(localStorage.getItem("classList"))[this.value].courseCredits}`);
            $("#editCoursePrerequisites").attr("value", `${JSON.parse(localStorage.getItem("classList"))[this.value].coursePrerequisite}`);
            $("#editCourseDescription").val(`${JSON.parse(localStorage.getItem("classList"))[this.value].courseDescription}`);
            $("#editCourseRepeatability").attr("value", `${JSON.parse(localStorage.getItem("classList"))[this.value].courseRepeatability}`);
            $("#editCourseCore").attr("value", `${JSON.parse(localStorage.getItem("classList"))[this.value].courseCore}`);
            $("#editCourseFee").attr("value", `${JSON.parse(localStorage.getItem("classList"))[this.value].courseFee}`);
        })

        $("#editCourseDeleteButton").on("click", function() {
            editCourseContainer.classList.toggle("fadeOut");
            editCourseContainer.classList.toggle("fadeIn");
            editCourseContainer.style.visibility = "visible";
        }) 

        $("#editCourseSubmitButton").on("click", function() {
            editCourseContainer.classList.toggle("fadeOut");
            editCourseContainer.classList.toggle("fadeIn");
            editCourseContainer.style.visibility = "visible";
        }) 

    }
    else {
        sessionStorage.getItem("editingCourses") === "false"
        editCourseContainer.classList.toggle("fadeOut");
        editCourseContainer.classList.toggle("fadeIn");
        editCourseContainer.style.visibility = "visible";
    }
})

let editCourseClose = document.querySelector("#editCourseClose");
editCourseClose.addEventListener("click", function () {
    if (sessionStorage.getItem("editingCourses") === "true") {
        setTimeout(function () {
            editCourseContainer.style.visibility = "hidden";
        }, 1000)
        editCourseContainer.classList.toggle("fadeIn");
        editCourseContainer.classList.toggle("fadeOut");
        sessionStorage.setItem("editingCourses", "false");
    }
})

$("#removeButton").on("click", function () {
    if (sessionStorage.getItem("removingCourses") === "true") {
        sessionStorage.setItem("removingCourses", "false");
        $("#removeButton").css("font-weight", "");
        $(".fallId").off("click");
        $(".springId").off("click");
        saveCourses();
    }
    else {
        sessionStorage.setItem("removingCourses", "true");
        $("#removeButton").css("font-weight", "bold");
        $(".fallId").on("click", function () {
            console.log("course remove");
            this.textContent = "";
            this.parentNode.querySelector(".fallCourse").textContent = "";
            this.parentNode.querySelector(".fallHours").textContent = "0";
        })
        $(".springId").on("click", function () {
            console.log("course remove");
            this.textContent = "";
            this.parentNode.querySelector(".springCourse").textContent = "";
            this.parentNode.querySelector(".springHours").textContent = "0";
        })
    }
})

$("#addButton").on("click", function () {
    if (sessionStorage.getItem("addingCourses") === "true") {
        sessionStorage.setItem("addingCourses", "false");
        $("#addButton").css("font-weight", "");

        let selectedCourses = $('.fallId select, .springId select');
        for (let i = 0; i < selectedCourses.length; i++) {
            console.log(selectedCourses[i].value);
            selectedCourses[i].parentNode.innerHTML = selectedCourses[i].value;
        }
        saveCourses();
    }
    else {
        sessionStorage.setItem("addingCourses", "true");
        $("#addButton").css("font-weight", "bold");
        const options = [""];
        let thisCourse = JSON.parse(localStorage.getItem("classList"));
        for (let course in thisCourse) {
            if (thisCourse.hasOwnProperty(course)) {
                options.push(course);
            }
        }
        options.sort();

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
                fallCourses[i].addEventListener("change", function () {
                    fallCourses[i].parentNode.querySelector(".fallCourse").textContent = thisCourse[selectElement.value].courseName;
                    fallCourses[i].parentNode.querySelector(".fallHours").textContent = thisCourse[selectElement.value].courseCredits;
                })
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
                springCourses[i].addEventListener("change", function () {
                    springCourses[i].parentNode.querySelector(".springCourse").textContent = thisCourse[selectElement.value].courseName;
                    springCourses[i].parentNode.querySelector(".springHours").textContent = thisCourse[selectElement.value].courseCredits;
                })
            }
        }
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

updateTotalHours();
document.addEventListener('click', updateTotalHours);

// Clears the LocalStorage.
//localStorage.clear();