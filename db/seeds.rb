# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl_rails'

3.times do
  FactoryGirl.create :topic
end

# 10.times do
#   FactoryGirl.create :user
# end

# 100.times do
#   FactoryGirl.create :curriculum
# end

# 40.times do
#   FactoryGirl.create :video
# end

# 1000.times do
#   FactoryGirl.create :vote
# end

# 10.times do
#   FactoryGirl.create :subscription
# end
