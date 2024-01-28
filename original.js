

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


// Clears the LocalStorage.
//localStorage.clear();

updateTotalHours();
document.addEventListener('click', updateTotalHours);