FactoryGirl.define do
  factory :item do
    name "テスト"
    description "テスト"
    condition "目立った傷や汚れなし"
    delivery_method "らくらくメルカリ便"
    delivery_days "3"
    price "2000"
    delivery_burden "送料込み(出品者負担)"
    delivery_from "東京"
    size "フリーサイズ"
  end
end
