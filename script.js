// Session handlers for dark mode and the course display user interface.
sessionStorage.setItem("newDegree", "false");
sessionStorage.setItem("openCourse", "false");
sessionStorage.setItem("newOpenCourse", "false");
sessionStorage.setItem("editingCourses", "false");
sessionStorage.setItem("adminScreen", "false");
sessionStorage.setItem("removingCourses", "false");
sessionStorage.setItem("addingCourses", "false");

$(function () {
    // First Time Loading
    $(".tableSection").hide();
    $("#degreeHeading").hide();

    if (localStorage.getItem("degreesList") === null) {
        fetch("degreesList.json")
            .then(res => res.json())
            .then(jsonData => {
                localStorage.setItem("degreesList", JSON.stringify(jsonData));
                console.log("degreesList.json was loaded for the first time.");
                console.log(jsonData);
                location.reload();
            });
    }
    if (localStorage.getItem("classList") === null) {
        fetch("classList.json")
            .then(res => res.json())
            .then(jsonData => {
                localStorage.setItem("classList", JSON.stringify(jsonData));
                console.log("classList.json was loaded for the first time.");
                console.log(jsonData);
                location.reload();
            });
    }
    loadMapSelection();
})

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
        if (totalHours > 18) {
            totalFallHours[i].style.color = "red";
        }
        else {
            totalFallHours[i].style.color = "black";
        }
    }
    let totalSpringHours = document.querySelectorAll(".springTotal");
    for (let i = 0; i < totalSpringHours.length; i++) {
        let totalHours = parseInt("0", 10);
        let courseHours = totalSpringHours[i].parentNode.parentNode.parentNode.querySelectorAll(".springHours");
        for (let j = 0; j < courseHours.length; j++) {
            totalHours += parseInt(courseHours[j].textContent, 10);
        }
        totalSpringHours[i].textContent = totalHours;
        if (totalHours > 18) {
            totalSpringHours[i].style.color = "red";
        }
        else {
            totalSpringHours[i].style.color = "black";
        }
    }
}

$("#homeButton").on("click", function () {
    location.reload();
})

let degreesList = JSON.parse(localStorage.getItem("degreesList"));
let classList = JSON.parse(localStorage.getItem("classList"));

function loadMapSelection() {
    // Clear any maps that may have been in the dropdown.
    document.querySelector(".dropdown-menu").innerHTML = "";
    // Iterate through all degree plans and add it to the dropdown.
    for (let key in degreesList) {
        if (degreesList.hasOwnProperty(key)) {
            let listItem = `<li><a class="dropdown-item bg-danger text-white">${key}</a></li>`;
            $(".dropdown-menu").append(listItem);
        }
    }
    // Add the divider and create new map button.
    $(".dropdown-menu").append(`<li><hr class="dropdown-divider"></li>`);
    $(".dropdown-menu").append(`<li><a class="dropdown-item bg-danger text-white">Create New Map</a></li>`);
    // Event listeners for the map options.
    $("li a").on("click", function () {
        if ($(this).text() === "Create New Map") {
            if (sessionStorage.getItem("newDegree") === "false") {
                sessionStorage.setItem("newDegree", "true");
                document.querySelector("#newDegreeContainer").classList.toggle("fadeOut");
                document.querySelector("#newDegreeContainer").classList.toggle("fadeIn");
                document.querySelector("#newDegreeContainer").style.visibility = "visible";
            }
            return;
        }
        loadDegree($(this).text());
    })
}

function loadDegree(degreeName) {
    if (degreesList[degreeName] !== null) {
        // Clear the table in case another degree was opened.
        clearTable();
        // Declare variables for parsed JSON keys.
        let degreeHeader = degreesList[degreeName]["Header"];
        let tableYear1 = degreesList[degreeName]["Table"]["Year 1"];
        let tableYear2 = degreesList[degreeName]["Table"]["Year 2"];
        let tableYear3 = degreesList[degreeName]["Table"]["Year 3"];
        let tableYear4 = degreesList[degreeName]["Table"]["Year 4"];
        // Hide the welcome page and show the tables.
        $("section").hide();
        $(".tableSection").show();
        $("#degreeHeading").show();
        // Update the degree heading.
        $("#degreeHeading h1").text(`College of ${degreeHeader["College"]}`);
        $("#degreeHeading h2").text(`Bachelor of ${degreeHeader["Bachelors"]} in ${degreeName}`);
        // Load the courses into their respective positions.
        for (let i = 1; i <= 5; i++) {
            $(`.Year1Fall${i}`).text(tableYear1[`Fall${i}`]);
            $(`.Year1Spring${i}`).text(tableYear1[`Spring${i}`]);
        }
        for (let i = 1; i <= 6; i++) {
            $(`.Year2Fall${i}`).text(tableYear2[`Fall${i}`]);
            $(`.Year2Spring${i}`).text(tableYear2[`Spring${i}`]);
        }
        for (let i = 1; i <= 5; i++) {
            $(`.Year3Fall${i}`).text(tableYear3[`Fall${i}`]);
            $(`.Year3Spring${i}`).text(tableYear3[`Spring${i}`]);
        }
        for (let i = 1; i <= 5; i++) {
            $(`.Year4Fall${i}`).text(tableYear4[`Fall${i}`]);
            $(`.Year4Spring${i}`).text(tableYear4[`Spring${i}`]);
        }
        // Load the information of the corresponding courses.
        loadCourseInformation();
    }
    else {
        alert("Exception! Could not load degree.");
    }
}

// Functionality to create a new degree.
$("#newDegreeSubmitButton").on("click", function () {
    let newDegreeName = $("#newDegreeName").val();
    let newCollegeName = $("#newCollegeName").val();
    let newBachelorName = $("#newBachelorName").val();
    if (degreesList[newDegreeName] !== undefined) {
        alert("This degree already exists!");
        return;
    }
    degreesList[newDegreeName] = {
        "Header": {
            "College": newCollegeName,
            "Bachelors": newBachelorName
        },
        "Table": {
            "Year 1": {
                "Fall1": "",
                "Fall2": "",
                "Fall3": "",
                "Fall4": "",
                "Fall5": "",
                "Spring1": "",
                "Spring2": "",
                "Spring3": "",
                "Spring4": "",
                "Spring5": ""
            },
            "Year 2": {
                "Fall1": "",
                "Fall2": "",
                "Fall3": "",
                "Fall4": "",
                "Fall5": "",
                "Fall6": "",
                "Spring1": "",
                "Spring2": "",
                "Spring3": "",
                "Spring4": "",
                "Spring5": "",
                "Spring6": ""
            },
            "Year 3": {
                "Fall1": "",
                "Fall2": "",
                "Fall3": "",
                "Fall4": "",
                "Fall5": "",
                "Spring1": "",
                "Spring2": "",
                "Spring3": "",
                "Spring4": "",
                "Spring5": ""
            },
            "Year 4": {
                "Fall1": "",
                "Fall2": "",
                "Fall3": "",
                "Fall4": "",
                "Fall5": "",
                "Spring1": "",
                "Spring2": "",
                "Spring3": "",
                "Spring4": "",
                "Spring5": ""
            }
        }
    }
    // Save the new degree to Local Storage.
    localStorage.setItem("degreesList", JSON.stringify(degreesList));
    loadMapSelection();
})
$("#newDegreeClose").on("click", function () {
    if (sessionStorage.getItem("newDegree") === "true") {
        let newDegreeContainer = document.querySelector("#newDegreeContainer");
        setTimeout(function () {
            newDegreeContainer.style.visibility = "hidden";
        }, 1000)
        newDegreeContainer.classList.toggle("fadeIn");
        newDegreeContainer.classList.toggle("fadeOut");
        sessionStorage.setItem("newDegree", "false");
    }
})


function loadCourseInformation() {
    let fallIds = document.querySelectorAll(".fallId");
    for (let i = 0; i < fallIds.length; i++) {
        if (fallIds[i].textContent === "") {
            fallIds[i].parentNode.querySelector(".fallHours").textContent = "0";
        }
        else {
            let courseName = classList[fallIds[i].textContent]["courseName"];
            let courseCredits = classList[fallIds[i].textContent]["courseCredits"];
            fallIds[i].parentNode.querySelector(".fallCourse").textContent = courseName;
            fallIds[i].parentNode.querySelector(".fallHours").textContent = courseCredits;
        }
    }
    let springIds = document.querySelectorAll(".springId");
    for (let i = 0; i < springIds.length; i++) {
        if (springIds[i].textContent === "") {
            springIds[i].parentNode.querySelector(".springHours").textContent = "0";
        }
        else {
            let courseName = classList[springIds[i].textContent]["courseName"];
            let courseCredits = classList[springIds[i].textContent]["courseCredits"];
            springIds[i].parentNode.querySelector(".springCourse").textContent = courseName;
            springIds[i].parentNode.querySelector(".springHours").textContent = courseCredits;
        }
    }
    updateTotalHours();
}

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
$("#courseClose").on("click", function () {
    if (sessionStorage.getItem("openCourse") === "true") {
        setTimeout(function () {
            courseContainer.style.visibility = "hidden";
        }, 1000)
        courseContainer.classList.toggle("fadeIn");
        courseContainer.classList.toggle("fadeOut");
        sessionStorage.setItem("openCourse", "false");
    }
})

function clearTable() {
    $(".fallId, .fallCourse, .springId, .springCourse").text("");
    $(".creditHours").text("0");
}