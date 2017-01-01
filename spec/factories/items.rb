FactoryGirl.define do
  factory :item do
    # email "user@example.com"
    # password "please123"
    title Faker::Commerce.product_name
    inventory Faker::Number.number(2)
    price Faker::Number.number(4)
  end
end
