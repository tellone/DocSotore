require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.email 'test@glhf.com'
    f.password 'glhf'
    f.name 'mytest'
  end
end


FactoryGirl.define do
  factory :document do |f|
    user
    f.title 'publish'
  end
end
