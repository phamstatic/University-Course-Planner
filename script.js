var courseList = document.querySelectorAll('tbody tr');
for (let i = 0; i < courseList.length; i++) {
    courseList[i].addEventListener('click', function() {
        alert("Clicked a course.");
    })
}