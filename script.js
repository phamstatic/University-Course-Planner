$(function() {
    // First Time Load
    if (localStorage.getItem("degreesList") === null) {
        fetch("degreesList.json")
        .then(res => res.json())
        .then(jsonData => {
            localStorage.setItem("degreesList", JSON.stringify(jsonData));
            console.log("degreesList.json was loaded for the first time.");
            console.log(jsonData);
        });
    }
    if (localStorage.getItem("classList") === null) {
        fetch("classList.json")
        .then(res => res.json())
        .then(jsonData => {
            localStorage.setItem("classList", JSON.stringify(jsonData));
            console.log("classList.json was loaded for the first time.");
            console.log(jsonData);
        });
    }
})

$("li a").on("click", function() {
    $("section").css("visibility", "hidden");
})

