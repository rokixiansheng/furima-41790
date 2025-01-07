# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## users table

|column           |type   | options                   |
|-----------------|-------|---------------------------|
|nickname         |string | null: false               |
|email            |string | null: false, unique: true |
|password         |string | null: false               |
|first_name       |string | null: false               |
|family_name      |string | null: false               |
|first_name_kana  |string | null: false               |
|family_name_kana |string | null: false               |
|birth_year       |string | null: false               |
|birth_month      |string | null: false               |
|birth_day        |string | null: false               |


### Association
- has_many items
- has_many orders


## items table

|column        |type       | options                        |
|--------------|-----------|--------------------------------|
|name          |string     | null: false                    |
|image         |text       | null: false                    |
|price         |string     | null: false                    |
|introduction  |string     | null: false                    |
|category      |string     | null: false                    |
|situation     |string     | null: false                    |
|shipping_fee  |string     | null: false                    |
|shipping_from |string     | null: false                    |
|shipping_date |string     | null: false                    |
|seller_id     |references | null: false, foreign_key: true |


### Association
- belongs_to user 
- has_one order




## orders table
|column        |type       | options                        |
|--------------|-----------|--------------------------------|
|user_id       |references | null: false, foreign_key: true |
|seller_id     |references | null: false, foreign_key: true |


### Association
- belongs_to user
- has_one item
- has_one delivery


## deliveries table
|column        |type       | options                        |
|--------------|-----------|--------------------------------|
|post_code     |string     | null: false                    |
|prefecture    |string     | null: false                    |
|city          |string     | null: false                    |
|address_detail|string     | null: false                    |
|building      |string     |                                |
|tel           |string     | null: false                    |

### Association
- has_one order


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
