require 'spec_helper'
describe "the user view" do
  describe "users/index.html.haml" do
    before :each do
      visit '/users'
    end
    it "Has a header" do
      page.should have_content("Wellcome to the Document Storage!")
    end
    it "has a link to sign up page" do
      page.should have_link('log in')
      page.should have_link('recover lost password')
    end
    it " has a login form" do
      within('#login_form') do
        fill_in 'Email', :with => 'gotoexaple@obv.se'
        fill_in 'Password', :with =>'secuity!'
      end
      click_button 'Sign in'
    end
    it " has a list of users currently logged in" do

      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      visit '/users'
      page.should have_link(user1.email)
      page.should have_link(user2.email)
    end
  end


  describe "users/show.html.haml" do
    before :each do
      
      @user1 = FactoryGirl.create(:user)
      # @user2 = FactoryGirl.create(:user)
      visit '/users'
    end

    it "displayes profile and links to edit" do

      click_link(@user1.email)
      page.should have_content(@user1.email)
      page.should have_link("edit profile")
      page.should have_link("delete user")
    end  
    
    it "Has options for own documents" do
      
      doc1 = FactoryGirl.create(:document)
      visit user_path(@user1)
      page.should have_content("Documents")
      pending("set up the documet model")
      page.should have_link("doc1.title")
    end
  end
  describe "users/edit.html.haml" do
  before :each do
      
      @user1 = FactoryGirl.create(:user)
      # @user2 = FactoryGirl.create(:user)
      visit edit_user_path(@user1)
    end
 
    it "Displays an edit form with email and password" do
      pending
    end
  end
end
    
