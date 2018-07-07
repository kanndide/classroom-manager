# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# username, email, password, first_name, last_name, bio, teacher, admin

bio1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum nisi tincidunt erat placerat pulvinar. Curabitur placerat, nibh eget pulvinar maximus, massa dolor tristique metus, ut vehicula est elit id augue. Fusce suscipit lacus non leo porttitor, et dapibus magna luctus. Aenean nec tempus augue. Nunc molestie eget urna vitae blandit. In vel lacus laoreet, lobortis elit vitae, vulputate nulla. Mauris gravida nibh eget eleifend egestas."
bio2 = "Integer sed finibus quam. Proin lobortis ex quis tortor luctus rhoncus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam dapibus enim eros, non tempus est cursus a. Phasellus arcu nisl, ultricies non purus et, tempor pretium sapien. Sed nec justo sodales, efficitur sem in, scelerisque nunc. Nam auctor blandit ante eget ultrices. Morbi at ante non eros vestibulum lacinia quis eget leo. Phasellus dapibus diam felis, quis posuere leo pharetra eget. Aenean elementum quam lacus, eu fermentum justo congue ut. Pellentesque pulvinar ligula eu elit tincidunt semper. Curabitur viverra, urna eu ultricies finibus, libero ex rhoncus ligula, vehicula eleifend felis mauris ut dolor."
bio3 = "Sed facilisis dapibus lorem. Maecenas vestibulum aliquet velit sit amet euismod. Phasellus et ornare augue, sed vehicula nisi. Maecenas tristique at tortor ut hendrerit. Integer id diam lorem. Proin convallis lectus ac elit consequat vestibulum. Maecenas volutpat tempus tellus dapibus consectetur. Cras dui tortor, porttitor id augue at, blandit efficitur libero. Aenean iaculis cursus sapien non lacinia. Nam aliquam ornare ex, sit amet pharetra tellus congue id. Curabitur augue mauris, euismod non vehicula in, ultrices non nisi. Nunc molestie sed turpis vel fringilla. Nulla ut nisl euismod, imperdiet odio sed, aliquam dui. Nunc nec erat vitae dolor consectetur varius non vitae nulla."
bio4 = "In hac habitasse platea dictumst. Fusce feugiat pulvinar porttitor. Curabitur pharetra hendrerit cursus. Aenean aliquam, felis in auctor ullamcorper, ante quam dictum magna, ac varius urna dolor non urna. Praesent orci ligula, commodo sed risus eget, bibendum consequat urna. Praesent est dui, imperdiet eget massa ut, hendrerit facilisis orci. Duis fermentum sollicitudin sapien quis blandit. Proin luctus, tellus eu elementum condimentum, nisl augue efficitur ipsum, vel rhoncus turpis ipsum et urna. In ac tincidunt ex. Sed sit amet viverra elit. Donec sit amet aliquam urna, pellentesque hendrerit mauris. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur semper, lorem id venenatis pharetra, enim ligula pretium erat, vel pharetra metus nulla sit amet tellus. Morbi condimentum mi in lectus pellentesque, vitae porttitor diam laoreet. Pellentesque augue metus, hendrerit et tortor euismod, ullamcorper condimentum nunc."
bio5 = "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse sagittis eros dui, id convallis est hendrerit sit amet. Sed luctus nulla tristique libero vehicula, id eleifend augue mollis. Vestibulum lacinia tellus quam, sed efficitur purus efficitur vitae. Fusce porta quam nec urna dictum, at pellentesque risus fermentum. Nunc luctus hendrerit tellus ac tristique. Duis nulla dui, fringilla quis convallis sit amet, consequat ut nisi. Suspendisse sed turpis ornare, cursus diam eget, consequat mauris."

# Creating students
User.create(username: "BtKid", email: "sixgun@gmail.com", password: "password", first_name: "Henry", last_name: "McCarty", bio: "I'm and outlaw!")
User.create(username: "jsmith", email: "random1@gmail.com", password: "password", first_name: "John", last_name: "Smith", bio: bio1)
User.create(username: "okcoral", email: "random2@gmail.com", password: "password", first_name: "Wyatt", last_name: "Earp", bio: bio2)
User.create(username: "sjose", email: "random3@gmail.com", password: "password", first_name: "Samantha", last_name: "Jose", bio: bio3)
User.create(username: "reddead", email: "random4@gmail.com", password: "password", first_name: "John", last_name: "Martson", bio: bio4)
User.create(username: "docholiday", email: "random5@gmail.com", password: "password", first_name: "John", last_name: "Holiday", bio: bio5)
User.create(username: "dutchess", email: "random6@gmail.com", password: "password", first_name: "Sterlin", last_name: "Archer", bio: bio1)
User.create(username: "bestinuniverse", email: "random7@gmail.com", password: "password", first_name: "Rick", last_name: "Sanchez", bio: bio2)
User.create(username: "spacekid", email: "random8@gmail.com", password: "password", first_name: "Morty", last_name: "Smith", bio: bio3)
User.create(username: "bighands", email: "random9@gmail.com", password: "password", first_name: "Lona", last_name: "Kane", bio: bio4)

# Creating Teachers

User.create(username: "teacher1", email: "teacher1@gmail.com", password: "password", first_name: "Jason", last_name: "Bourne", bio: bio1, teacher: true)
User.create(username: "teacher2", email: "teacher2@gmail.com", password: "password", first_name: "Jasmine", last_name: "Banks", bio: bio2, teacher: true)

# Creating Admin

User.create(username: "admin", email: "admin@gmail.com", password: "password", first_name: "Larry", last_name: "Fowler", bio: bio2, admin: true)

# Creating Schools

School.create(name: "Flynt High School")
School.create(name: "Griffin High School")

# Creating Lectures

Lecture.create(name: "Algebra I" , time: "0900" , day: "Monday - Friday", location: "Room 502", semester: "Fall")

# User Lectures

UserLecture.create(user_id: 1, lecture_id: 1)

# School Users

SchoolUser.create(user_id: 1, school_id: 2)















































