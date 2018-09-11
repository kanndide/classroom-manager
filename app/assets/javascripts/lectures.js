// function Lecture(data) {
// 	this.id = Number(data.id);
// 	this.name = data["attributes"].name;
// 	this.semester = data["attributes"].semester;
// 	this.time = data["attributes"].time;
// 	this.location = data["attributes"].location;
// 	this.day = data["attributes"].day;
// 	this.year = Number(data["attributes"].year);
// };

// Lecture.prototype.formatLectureShowLink = function() {
// 	return `<a href="/lectures/${this.id}">${this.semester} - ${this.name}, ${this.time}</a><br>`
// };

class Lecture {
	constructor(data) {
		this.id = Number(data.id);
		this.name = data["attributes"].name;
		this.semester = data["attributes"].semester;
		this.time = data["attributes"].time;
		this.location = data["attributes"].location;
		this.day = data["attributes"].day;
		this.year = Number(data["attributes"].year);
	};

	formatLectureShowLink() {
		return `<a href="/lectures/${this.id}">${this.semester} - ${this.name}, ${this.time}</a><br>`
	};
};



function showNewLecture() {
	$('form').submit(function(event) {
		event.preventDefault();
		params = $(this).serialize()
		newLecture = $.post('/lectures', params)
		newLecture.done(function(data) {
			lecture = new Lecture(data["data"])
			userId = Number(data["data"]["relationships"]["users"]["data"][0]["id"])
			$('#newLectureName').append(lecture.name)
			$('#showNewLecture').append(`<p>${lecture.time}</p><br>`)
			$('#showNewLecture').append(`<p>${lecture.day}</p><br>`)
			$('#showNewLecture').append(`<p>${lecture.semester}</p><br>`)
			$('#showNewLecture').append(`<p>${lecture.location}</p><br>`)
			// $('#showNewLecture').append(`<p>${lecture.school}</p><br>`)
			$('#showNewLecture').append(`<p>${lecture.year}</p><br>`)
			$('#showNewLecture').append(`<a href="/users/${userId}/lectures/${lecture.id}/edit">Edit Class</a><br>`)
		});
	});
};

function getLectures() {
	$('#viewSchedule').click(function(event) {
		event.preventDefault();
		$.get('/lectures', function(data) {
			var today = new Date()
			var year = today.getFullYear()
			var lecturesArray = data["data"]
			$('#panelHeader')[0].innerHTML = '<h1>Scheduled Lectures</h1>'
			$('#panelBody')[0].innerHTML = ''
			$('#panelBody').append(`<h3>${year}</h3>`)
			for (let data of lecturesArray) {
				lecture = new Lecture(data)
				if(lecture.year === year) {
					$('#panelBody').append(lecture.formatLectureShowLink())
				};
			};
			$('#panelBody').append(`<h3>${year + 1}</h3>`)
			for (let data of lecturesArray) {
				lecture = new Lecture(data)
				if(lecture.year === year + 1) {
					$('#panelBody').append(lecture.formatLectureShowLink())
				};
			};
		}, "json");
	});
};
