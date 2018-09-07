function showSchoolLectures() {
	$('form').submit(function(event) {
		event.preventDefault()
		var id = $('select option:checked').val()
		$.get(`/schools/${id}`, function(data) {
			var school = data["data"]
			var lectures = school["relationships"]["lectures"]["data"]
			$('#schoolName').text(school["attributes"].name)
			for (let info of lectures){
				let newId = Number(info.id)
				$.get(`/lectures/${newId}.json`, function(data) {
					lecture = data["data"]
					lectureName = lecture["attributes"]["name"]
					lectureTime = lecture["attributes"]["time"]
					$('#schoolLectures').append(`<a href="/lectures/${newId}">${lectureName}, ${lectureTime}</a><br>`)
				});
			};
		});
	});
};