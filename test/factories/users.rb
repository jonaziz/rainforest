# Read about factories at https://github.com/thoughtbot/factory_girl

# Sequence used to generate different emails when create is called more than once.
## Our model says that emails must be unique.

FactoryGirl.define do
  factory :user do
    name "Michael"
    sequence(:email) {|n| "user_#{n}gmail.com"}
    password "test"
    password_confirmation "test"
  end
end
