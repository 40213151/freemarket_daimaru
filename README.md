# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :items, dependent: :destroy
- has_many :reviews, dependent: :destroy
- has_many :user_profiles, dependent: :destroy

## users_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postal_code|integer|null: false|
|pfefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false, unique: true|
|building_name|string||
|phone_number|string||
|birthday|date|null: false|
|profile_text|text||
|user_image|string||

### Association
- belongs_to :user, dependent: :destroy,foreign_key: "user_id"

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false, add_index, length: {maximum: 40}|
|description|text|null: false, length: {maximum: 1000}|
|condition|string|null: false|
|delovery_method|string|null: false|
|delovery_days|string|null: false|
|price|string|null: false, validates :price,numericality: { greater_than: 200, less_than: 10000000}|
|first_category_id|integer|null: false, foreign_key: true|
|second_category_id|integer|null: false, foreign_key: true|
|third_category_id|integer|null: false, foreign_key: true|
|bland_id|integer|foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy,foreign_key: "user_id"
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category
- belongs_to :bland
- has_many :item_images, dependent::destroy

## first_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
- has_many :items

## second_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
- has_many :items

## third_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
- has_many :items

## blandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|add: index|


### Association
- has_many :items

### Association
- belongs_to :item, dependent: :destroy,foreign_key: "item_id"

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|


### Association
- belongs_to :item, dependent: :destroy,foreign_key: "item_id"

## reviewssテーブル

|Column|Type|Options|
|------|----|-------|
|review|integer|enum status: { good: 0, medium: 1, bad: 2 }|


### Association
- belongs_to :user, foreign_key: "user_id"
