// Session handlers for dark mode and the course display user interface.
sessionStorage.setItem("selectedDegree", "none");
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
        localStorage.setItem("selectedDegree", degreeName);
        console.log(`Degree Selected: ${degreeName}`);
        // Clear the table in case another degree was opened.
        clearTable();
        // Declare variables for parsed JSON keys.
        let degreeHeader = degreesList[degreeName]["Header"];
        let tableYear1 = degreesList[degreeName]["Table"]["Year 1"];
        let tableYear2 = degreesList[degreeName]["Table"]["Year 2"];
        let tableYear3 = degreesList[degreeName]["Table"]["Year 3"];
        let tableYear4 = degreesList[degreeName]["Table"]["Year 4"];
        // Show the admin button.
        $("#adminButton").css("visibility", "visible");
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
let newDegreeContainer = document.querySelector("#newDegreeContainer");
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
    newDegreeContainer.classList.toggle("fadeIn");
    newDegreeContainer.classList.toggle("fadeOut");
    sessionStorage.setItem("newDegree", "false");
})
$("#newDegreeClose").on("click", function () {
    if (sessionStorage.getItem("newDegree") === "true") {
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
            //saveCourses();
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

$("#addButton").on("click", function () {
    if (sessionStorage.getItem("addingCourses") === "true") {
        sessionStorage.setItem("addingCourses", "false");
        $("#addButton").css("font-weight", "");

        let selectedCourses = $('.fallId select, .springId select');
        for (let i = 0; i < selectedCourses.length; i++) {
            console.log(selectedCourses[i].value);
            selectedCourses[i].parentNode.innerHTML = selectedCourses[i].value;
        }
        //saveCourses();
    }
    else {
        if (sessionStorage.getItem("editingCourses") === "true" || sessionStorage.getItem("removingCourses") === "true" || sessionStorage.getItem("newOpenCourse") === "true") {
            alert("Finish your other activities first!");
            return;
        }
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

$("#removeButton").on("click", function () {
    if (sessionStorage.getItem("removingCourses") === "true") {
        sessionStorage.setItem("removingCourses", "false");
        $("#removeButton").css("font-weight", "");
        $(".fallId").off("click");
        $(".springId").off("click");
        $(".fallId, .springId").toggleClass("Delete");
        //saveCourses();
    }
    else {
        if (sessionStorage.getItem("editingCourses") === "true" || sessionStorage.getItem("addingCourses") === "true" || sessionStorage.getItem("newOpenCourse") === "true") {
            alert("Finish your other activities first!");
            return;
        }
        sessionStorage.setItem("removingCourses", "true");
        $(".fallId, .springId").toggleClass("Delete");
        $("#removeButton").css("font-weight", "bold");
        $(".fallId").on("click", function () {
            this.textContent = "";
            this.parentNode.querySelector(".fallCourse").textContent = "";
            this.parentNode.querySelector(".fallHours").textContent = "0";
        })
        $(".springId").on("click", function () {
            this.textContent = "";
            this.parentNode.querySelector(".springCourse").textContent = "";
            this.parentNode.querySelector(".springHours").textContent = "0";
        })
    }
})
