function showSchoolLectures() {
	$('form').submit(function(event) {
		event.preventDefault()
		id = $('select option:checked').val()
		$.get(`/schools/${id}`, function(data) {
			school = data["data"]
			lectures = school["relationships"]["lectures"]
			debugger
		});
	});
};