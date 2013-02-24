require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    sequence(:email) {|n| "person#{n}@example.com"}
    f.password 'glhf'
    # f.name 'mytest'
end


# FactoryGirl.define do
#   factory :document do |f|
#     user
#     f.title 'publish'
#   end
end
