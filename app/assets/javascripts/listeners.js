$(document).ready(function() {
	attachListeners()
})

function attachListeners() {
	$('#schoolUserSubmit').on('click', () => createAssociatedSchools());
	$('#schoolFindLectures').on('click', () => showSchoolLectures())
}
