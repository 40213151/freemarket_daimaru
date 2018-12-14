FactoryGirl.define do
  factory :image do
    image File.open("#{Rails.root}/public/images/no_image.jpg")
    item
  end
end
