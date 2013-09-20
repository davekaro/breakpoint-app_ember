# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name "MyString"
    date "2013-09-20 14:19:55"
    singles_matches 1
    doubles_matches 1
  end
end
