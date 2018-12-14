# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 4.times do |i|
#      Item.create(name: "テスト #{i}", description: "テスト #{i}", condition: "目立った傷や汚れなし", delivery_method: "らくらくメルカリ便", delivery_days: "3", price: "400")
# end

4.times do |i|
     Image.create(image: "item_sample_#{i + 1}.jpg", item_id: "#{i+ 1}")
end
