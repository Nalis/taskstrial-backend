# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'James George Jameson',
            email: 'test@example.org',
            password: 'password')

User.create(name: 'John Smith',
            email: 'bostko@gmail.com',
            password: 'password')

User.create(name: 'Valentin Aitken',
            email: 'yoou@abv.bg',
            password: 'password')

Task.create(title: 'Task 1', description: 'Desc 1', user: User.last)
