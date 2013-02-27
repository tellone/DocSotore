require 'factory_girl'

FactoryGirl.define do

  sequence(:email) { |n| "obvious#{n}@obv.com" }
  
 
  factory :user do
    email
    password 'glhf'
  end
    
  factory :error_user, parent: :user do
    password nil
  end

  factory :document do
    user
    title "publish"
  end
  factory :error_doc, parent: :document do
    title "pub"
  end
end
