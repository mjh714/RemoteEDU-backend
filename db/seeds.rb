# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'time'
puts "deleteing all"
User.destroy_all
Course.destroy_all
Meeting.destroy_all
UserCourse.destroy_all

puts "creating users"
# User.create(full_name: "Alex Beciana", email: "alexbeciana@gmail.com", password: "password", is_teacher: true)
User.create(full_name: "Michael Horowitz", email: "mjhorowitz714@yahoo.com", password: "password", is_teacher: true)
20.times do
    User.create(full_name: Faker::Name.name, email: Faker::Internet.email, password: "student",is_teacher: false)
end
alex = User.create(full_name: "Alex Beciana", email: "alexbeciana@gmail.com", password: "password", is_teacher: false)


10.times do
User.create(full_name: Faker::Name.name, email: Faker::Internet.email, password: "teacher",is_teacher: true)
end

puts "creating courses"
# Course.create(title: "Ruby 00", length: "3 weeks", student_count: 25, student_cap: 30)
# Course.create(title: "Rails", length: "3 weeks", student_count: 25, student_cap: 30)
# Course.create(title: "Almost Filled", length: "3 weeks", student_count: 28, student_cap: 30)
5.times do
Course.create(title: Faker::Educator.course_name, length: "3 weeks", student_count: rand(10..25), student_cap: 30)
end

puts "create usercourses"
21.times do
UserCourse.create(user_id: User.all.uniq.sample.id, course_id: Course.all.uniq.sample.id)
end
3.times do
UserCourse.create(user_id: alex.id, course_id: Course.all.uniq.sample.id)
end

puts "creating meetings"
10.times do 
    Meeting.create(date: Faker::Date.between(from: '2020-09-23', to: '2020-11-25').to_s, time: Time.strptime("4:20 PM", "%I:%M %P").strftime("%H:%M"), link: "https://www.youtube.com/watch?v=dQw4w9WgXcQ", course_id: Course.all.sample.id)
end
# Meeting.create(date: "2021-04-20", time: "4:20 PM", link: "https://www.youtube.com/watch?v=d1JA-nh0IfI", course_id: Course.all.first.id)

now = Time.now.to_i
minute_ago = (Time.now - 60).to_i
x = Time.at(rand(minute_ago..now))
meeting_time = x.to_s.split(" ")[1]

20.times do
    Meeting.create(date: Faker::Date.between(from: '2020-09-26', to: '2020-10-25'),time: meeting_time, link: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")
end

puts "all done! go forth and prosper!"