
require 'spec_helper'
describe "reset password" do
  @user1 = FactoryGirl.create(:user)
  @admin1 = FactoryGirl.create(:admin)
  visit "/auther/sign_in"
  page.should have_link("Forgot your password?")
  click_link("Forgot your password?")
  
  fill_in "user_email", :with => user.email
  click_button "send me reset password instructions"

  unread_emails_for(@user.email).size.should parse_email_count(1)
  open_email(@user.email)
  email_should_have_body("Someone has requested a link to change your password, and you can do this through the link below.")
  click_first_link_in_email

  within('body') do
    page.should have_content('Change Your Password')
  end

  fill_in "user_password", :with=>"This_is_new"
  fill_in "user_password_confirmation", :with=>"This_is_new"
  click_button "Change Password"

  within('body') do
    page.should have_content('Your password was changed successfully.')
  end

end
