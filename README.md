# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## users table

|column             |type   | options                   |
|-------------------|-------|---------------------------|
|nickname           |string | null: false               |
|email              |string | null: false, unique: true |
|encrypted_password |string | null: false               |
|first_name         |string | null: false               |
|family_name        |string | null: false               |
|first_name_kana    |string | null: false               |
|family_name_kana   |string | null: false               |
|birthday           |date   | null: false               |


### Association
- has_many items
- has_many orders


## items table

|column           |type       | options                        |
|-----------------|-----------|--------------------------------|
|name             |string     | null: false                    |
|price            |integer    | null: false                    |
|introduction     |text       | null: false                    |
|category_id      |integer    | null: false                    |
|situation_id     |integer    | null: false                    |
|shipping_fee_id  |integer    | null: false                    |
|shipping_from_id |integer    | null: false                    |
|shipping_date_id |integer    | null: false                    |
|user             |references | null: false, foreign_key: true |


### Association
- belongs_to user 
- has_one order




## orders table
|column        |type       | options                        |
|--------------|-----------|--------------------------------|
|user          |references | null: false, foreign_key: true |
|item          |references | null: false, foreign_key: true |


### Association
- belongs_to user
- belongs_to item
- has_one delivery



## deliveries table
|column           |type       | options                        |
|-----------------|-----------|--------------------------------|
|post_code        |string     | null: false                    |
|shipping_from_id |integer    | null: false                    |
|city             |string     | null: false                    |
|address_detail   |string     | null: false                    |
|building         |string     |                                |
|tel              |string     | null: false                    |
|order            |references | null: false, foreign_key: true |

### Association
- belongs_to order


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
