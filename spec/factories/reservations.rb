# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    user_id 1
    restaurant_id 1
    reserve_date "2014-10-29"
    reserve_time "2014-10-29 14:32:32"
  end
end
