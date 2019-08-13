FactoryGirl.define do
  factory :item do
    name "テスト"
    description "テスト"
    condition 1
    delivery_method "らくらくメルカリ便"
    delivery_days 1
    price 2000
    delivery_burden 1
    delivery_from 1
    size "フリーサイズ"
  end
end
