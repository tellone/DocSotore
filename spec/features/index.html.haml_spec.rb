require 'spec_helper'

describe "users/index.html.haml" do
  it "Has a header" do
    visit '/'
    page.should have_content("Wellcome to the Document Storage!")
  end
    it "has a link to sign up page" do
      visit '/'
      page.should have_link('log in')
      page.should have_link('recover lost password')
    end
    it " has a login form" do
      visit '/'
      within('#login_form') do
        fill_in 'Email', :with => 'gotoexaple@obv.se'
        fill_in 'Password', :with =>'secuity!'
      end
      click_button 'Sign in'
    end
    it " has a list of users currently logged in" do
    
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      visit root_path
      page.should have_link(user1.email)
      page.should have_link(user2.email)
    end
end
