require 'factory_girl'

FactoryGirl.define do

  sequence(:email) { |n| "obvious#{n}@obv.com" }
  
 
  factory :user do
    email
    password 'glhf'
  end
    
  factory :error_user do
    email nil
    password 'gogo'
  end

  # factory :document do |f|
  #   user
  #   owner_id user.id
  #   f.title "publish"
  #   file
  # end
end
