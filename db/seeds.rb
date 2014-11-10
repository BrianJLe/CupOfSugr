# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


categories = ['Indian', "Vietnamese", "Chinese", "Polish", "Japanese", "Korean","Thai", "Mexican", "Vegetarian","American" ]

categories.each do |category|
	Category.find_or_create_by(name: category)
end