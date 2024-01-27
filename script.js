$(function() {
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
})

$("li a").on("click", function() {
    if ($(this).text() === "Create New Map") {
        return;
    }
    loadDegree($(this).text());
})

let degreesList = JSON.parse(localStorage.getItem("degreesList"));

function loadDegree(degreeName) {
    if (degreesList[degreeName] !== null) {
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
    }
    else {
        alert("Exception! Could not load degree.");
    }
}

