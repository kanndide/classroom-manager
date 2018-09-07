function showNewLecture() {
	$('form').submit(function(event) {
		event.preventDefault();
		params = $(this).serialize()
		newLecture = $.post('/lectures', params)
		newLecture.done(function(data) {
			lecture = data["data"]["attributes"]
			id = Number(data["data"]["id"])
			userId = Number(data["data"]["relationships"]["users"]["data"][0]["id"])
			$('#newLectureName').append(lecture.name)
			$('#showNewLecture').append(`<p>${lecture.time}</p><br>`)
			$('#showNewLecture').append(`<p>${lecture.day}</p><br>`)
			$('#showNewLecture').append(`<p>${lecture.semester}</p><br>`)
			$('#showNewLecture').append(`<p>${lecture.location}</p><br>`)
			// $('#showNewLecture').append(`<p>${lecture.school}</p><br>`)
			$('#showNewLecture').append(`<p>${lecture.year}</p><br>`)
			$('#showNewLecture').append(`<a href="/users/${userId}/lectures/${id}/edit">Edit Class</a><br>`)
		});
	});
};