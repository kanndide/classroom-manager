$(document).ready(function() {
	attachListeners()
})

function attachListeners() {
	$('#schoolUserSubmit').on('click', () => createAssociatedSchools());
	$('#schoolFindLectures').on('click', () => showSchoolLectures());
	$('#newLectureFormButton').on('click', () => showNewLecture());
	$('#viewSchedule').on('click', () => getLectures()); 
}
