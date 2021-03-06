# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
	(SchoolUser, shows school after relationship is created.)
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
	(viewSchedule is a link to the lectures index route. This is rendered with JQuery now.)
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
	(School Lectures, Schools Index View, schools.js)
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
	(create new lecture, lectures.js, new lecture view)
- [x] Translate JSON responses into js model objects.
	(done with Active Model Serializer in multiple occasions)
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
	(in lecture.js, JSON response is translated into a JS Model Object. One methon on it's prototype is the format link method.)

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message