let courseList = document.querySelectorAll('tbody tr');
for (let i = 0; i < courseList.length; i++) {
    courseList[i].addEventListener('click', function() {
        let courseNumber = this.querySelector('td:first-child').innerHTML;
        console.log(`User clicked ${courseNumber}`);
    })
}