# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create([{username:"Packer", name:"Aaron Rogers", aboutme:"I am the quarterback for the Packers"}, {username:"Panther", name:"Cam Newton", aboutme:"I am the quarterback for the Panthers"}, {username:"Colt", name:"Andrew Luck", aboutme:"I am the quarterback for the Colts"}])

links = Link.create([{title:"Yahoo!", location:"http://www.yahoo.com", user_id:1,subcategory_id:3}, {title:"Google", location:"http://www.google.com", user_id:2,subcategory_id:3},{title:"AOL", location:"http://www.aol.com", user_id:3,subcategory_id:3},{title:"Reddit", location:"http://www.reddit.com", user_id:1,subcategory_id:3},{title:"Apple", location:"http://www.apple.com", user_id:2,subcategory_id:3},{title:"Facebook", location:"http://www.facebook.com", user_id:3,subcategory_id:3},{title:"Stack Overflow", location:"http://www.stackoverflow.com", user_id:1,subcategory_id:3},{title:"Ask", location:"http://www.ask.com", user_id:2,subcategory_id:3},{title:"Ben Folds", location:"http://www.benfolds.com", user_id:3,subcategory_id:3},])

subcategories = Subcategory.create([{name:"main"},{name:"cats"}, {name:"large_sites"}])
