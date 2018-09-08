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

function getLectures() {
	$('#viewSchedule').click(function(event) {
		event.preventDefault();
		$.get('/lectures.json', function(data) {
			var today = new Date()
			var year = today.getFullYear()
			var lecturesArray = data["data"]
			$('#userPanelHeader')[0].innerHTML = '<h1>Scheduled Lectures</h1>'
			$('#userPanelBody')[0].innerHTML = ''
			$('#userPanelBody').append(`<h3>${year}</h3>`)
			for (let lecture of lecturesArray) {
				lectureYear = Number(lecture["attributes"].year)
				if(lectureYear === year) {
					$('#userPanelBody').append(`<a href="/lectures/${Number(lecture.id)}">
						${lecture["attributes"].semester} - ${lecture["attributes"].name}, ${lecture["attributes"].time}</a><br>`)
				};
			};
			$('#userPanelBody').append(`<h3>${year + 1}</h3>`)
			for (let lecture of lecturesArray) {
				lectureYear = Number(lecture["attributes"].year)
				if(lectureYear === year + 1) {
					debugger
					$('#userPanelBody').append(`<a href="/lectures/${Number(lecture.id)}">
						${lecture["attributes"].semester} - ${lecture["attributes"].name}, ${lecture["attributes"].time}</a><br>`)
				};
			};
		});
	});
};

function sortLecturesByYear(lecturesArray) {

};