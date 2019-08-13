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
|nickname|string|null: false, index: true, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :items, dependent: :destroy
- has_many :user_profiles, dependent: :destroy

## users_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false, unique: true|
|building_name|string||
|phone_number|string||
|birthday|date|null: false|
|profile_text|text||
|profile_image|string||

### Association
- belongs_to :user, dependent: :destroy,foreign_key: "user_id"

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, length: {maximum: 40}|
|description|text|null: false, length: {maximum: 1000}|
|condition|string|null: false|
|delivery_method|string|null: false|
|delivery_days|integer|null: false|
|price|string|null: false, validates :price,numericality: { greater_than: 200, less_than: 10000000}|
|brand_id|integer|foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy,foreign_key: "user_id"
- has_many :categories,through: :category_groups
- has_many :category_groups
- has_one :brand
- has_many :item_images, dependent::destroy

## item_statusテーブル

|Column|Type|Options|
|------|----|-------|
|status|integer|enum status:{saved:0, buying:1, sold:2}|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## category_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|category|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|lft|integer|null: false|
|rgt|integer|null: false|
|level|integer|null: false|

### Association
- has_many :items, through: :category_groups
- has_many :category_groups

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|


### Association
- has_many :items
- belongs_to :item, dependent: :destroy,foreign_key: "item_id"

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|


### Association
- belongs_to :item, dependent: :destroy,foreign_key: "item_id"

## usersテーブル
<!-- 本来 Column,Type,Optionsと指定すべき箇所をなぜか各カラム名を書いている -->
|id|nickname|email|
|------|----|-------|
|id|string|null: false|
|nickname|string|null: false|
|email|string|null: false|

### Association
<!-- tweeetテーブルcommentsテーブルはchatspaceに存在しないはず -->
- has_many :tweets
- has_many :comments
