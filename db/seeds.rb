# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create([{:username => "admin", :password => "password", :password_confirmation => "password", :aboutme => "bulldogs45@aol.com", :name => "Matt Fair"},{:username => "BFair", :password => "password", :password_confirmation => "password", :aboutme => "I am admins twin", :name => "Ben Fair"},{:username => "SDFair", :password => "password", :password_confirmation => "password", :aboutme => "I am admins older brother", :name => "Dan Fair"}])

links = Link.create([{title:"Yahoo!", location:"http://www.yahoo.com", user_id:1,subcategory_id:1}, {title:"Google", location:"http://www.google.com", user_id:2,subcategory_id:3},{title:"AOL", location:"http://www.aol.com", user_id:3,subcategory_id:2},{title:"Reddit", location:"http://www.reddit.com", user_id:1,subcategory_id:3},{title:"Apple", location:"http://www.apple.com", user_id:2,subcategory_id:2},{title:"Facebook", location:"http://www.facebook.com", user_id:3,subcategory_id:1},{title:"Stack Overflow", location:"http://www.stackoverflow.com", user_id:1,subcategory_id:3},{title:"Ask", location:"http://www.ask.com", user_id:2,subcategory_id:3},{title:"Ben Folds", location:"http://www.benfolds.com", user_id:1,subcategory_id:2},{title:"Lilly", location:"http://www.lilly.com", user_id:1,subcategory_id:1},{title:"Best Buy", location:"http://www.bestbuy.com", user_id:3,subcategory_id:3},{title:"IUHealth", location:"http://www.iuhealth.org", user_id:1,subcategory_id:3},{title:"Target", location:"http://www.target.com", user_id:3,subcategory_id:2}])

subcategories = Subcategory.create([{name:"main", user_id:1},{name:"cats", user_id:2}, {name:"large_sites", user_id:3}])

links.each do |l|
  Vote.create(link_id:l.id, user_id:l.user.id)
end
