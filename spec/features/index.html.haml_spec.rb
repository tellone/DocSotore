require 'spec_helper'

describe "user/index.html.haml" do
  it "Has a header" do
    visit '/'
    page.should have_content("Wellcome to the Document Storage!")
  end
    it "has a link to sign up page" do
      visit '/'
      page.should have_link('login')
      page.should have_link('recover lost password')
    end
    it " has a login form" do
      visit '/'
      within('#login_form') do
        fill_in 'Email', :with => 'gotoexaple@obv.se'
        fill_in 'Password', :with =>'secuity!'
      end
    end

end
