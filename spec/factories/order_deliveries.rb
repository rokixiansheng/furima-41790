FactoryBot.define do
  factory :order_delivery do
    post_code           { '111-1111' }
    shipping_from_id    { 2 }
    city                { '神戸市' }
    address_detail      { '中央区1-1' }
    building            { 'kobeビル' }
    tel                 { 12345678911 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
