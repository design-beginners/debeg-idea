# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite do
    user_id 1
    target_id 1
    target_type "MyString"
  end
end
