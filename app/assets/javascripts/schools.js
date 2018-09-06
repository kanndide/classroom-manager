function showSchoolLectures() {
	$('form').submit(function(event) {
		event.preventDefault()
		var id = $('select option:checked').val()
		$.get(`/schools/${id}`, function(data) {
			var school = data["data"]
			var lectures = school["relationships"]["lectures"]["data"]
			$('#schoolName').text(school["attributes"].name)
			// debugger
			for (let info of lectures){
				let newId = Number(info.id)
				
				$('#schoolLectures').append()
			};
		});
	});
};