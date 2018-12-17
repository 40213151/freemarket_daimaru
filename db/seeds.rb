4.times do |i|
     Image.create(image: "item_sample_#{i + 1}.jpg", item_id: "#{i+ 1}")
end
