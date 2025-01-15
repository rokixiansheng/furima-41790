FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 2) }
    price                 { 5000 }
    introduction          { 'test' }
    category_id           { 5 }
    situation_id          { 3 }
    shipping_fee_id       { 2 }
    shipping_from_id      { 42 }
    shipping_date_id      { 2 }
    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end 

end

