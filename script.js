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
        $("#degreeHeading h1").text(degreeHeader["College"]);
        $("#degreeHeading h2").text(degreeHeader["Bachelors"]);
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
}

function clearTable() {
    $(".fallId, .fallCourse, .springId, .springCourse").text("");
    $(".creditHours").text("0");
}