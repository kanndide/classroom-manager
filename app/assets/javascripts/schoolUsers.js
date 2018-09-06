function createAssociatedSchools() {
	$('form').submit(function(event) {
		event.preventDefault();
		params = $(this).serialize()
		newSchool = $.post("/school_users", params)
		newSchool.done(function(data) {
			school = data["data"]["attributes"]
			$("#associatedSchools").append(`<h3> ${school.name} </h3>`)
		});
	});
};