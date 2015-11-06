# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
links = Link.create([{title:"Yahoo!", location:"http://www.yahoo.com", user_id:1,vote_id:nil}, {title:"Google", location:"http://www.google.com", user_id:1,vote_id:nil},{title:"AOL", location:"http://www.aol.com", user_id:1,vote_id:nil},{title:"Reddit", location:"http://www.reddit.com", user_id:1,vote_id:nil},{title:"Apple", location:"http://www.apple.com", user_id:1,vote_id:nil},{title:"Facebook", location:"http://www.facebook.com", user_id:1,vote_id:nil},{title:"Stack Overflow", location:"http://www.stackoverflow.com", user_id:1,vote_id:nil},{title:"Ask", location:"http://www.ask.com", user_id:1,vote_id:nil},{title:"Ben Folds", location:"http://www.benfolds.com", user_id:1,vote_id:nil},])
