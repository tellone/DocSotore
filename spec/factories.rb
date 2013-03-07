require 'factory_girl'
include ActionDispatch::TestProcess

FactoryGirl.define do

  sequence(:email) { |n| "obvious#{n}@obv.com" }
  
 
  factory :user do
    email
    password 'glhf#hldesign'
    admin false
    approved true
  end
  factory :admin, parent: :user do
    admin true
  end
  factory :error_user, parent: :user do
    password nil
  end

  factory :document do
    user
    title "publish"
    doc_file { fixture_file_upload(Rails.root + 'spec/fixuters/test.txt', 'text/plain') } 
    tag_list "How_to, author, informativ"
  end
  factory :error_doc, parent: :document do
    title "pub"
  end
end
