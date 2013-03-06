require 'spec_helper'
describe "the user view" do
  before :each do
    @user1 = FactoryGirl.create(:user)
    @admin1 = FactoryGirl.create(:admin)
  end
  describe "/users/sign_in" do
    it "has two links" do
      visit "/auther/sign_in"
      page.should have_link("Forgot your password?")
      page.should have_link("Sign up")
    end
  end
  context "as admin" do
    before :each do
      visit "/auther/sign_in"
      fill_in 'user_email', :with => @admin1.email
      fill_in 'Password', :with => @admin1.password
      click_button "Sign in"
    end

    describe "users/index.html.haml" do
      it "Has a header" do
        page.should have_content("Wellcome to the Document Storage!")
      end
      it " has a list of users currently logged in" do

        page.should have_link(@user1.email)
        page.should have_link(@admin1.email)
        page.should have_link("All documents")
      end
      it "has a sign out link" do
        page.should have_link("Sign out")
        click_link("Sign out")
      end

    end


    describe "users/show.html.haml" do

      it "displayes profile and links for other user to edit" do
        click_link(@user1.email)
        page.should have_content("Email: #{@user1.email}")
        page should have_link("edit profile")
        page.should have_link("delete user")
      end  

      it "Has options for own profile" do

        visit user_path(@admin1)
        page.should have_content("Documents")
        # pending("set up the documet model")
        page.should have_link(doc1.title)
        page should have_link("edit profile")
        page.should have_link("delete user")
      end

      it "has links to upload new document" do
        visit user_path(@user1)
        page.should have_link("Upload document")
      end
    end


    describe "users/edit.html.haml" do

      before :each do
        @user2 = FactoryGirl.create(:user)
        visit edit_user_path(@user1)
      end

      it "Displays an edit form with email and password" do
        page.should have_content("Edit user profile")
        within('#userform') do
          fill_in 'Email', :with => 'gotoexaple@obv.se'
          fill_in 'Password', :with => 'secure!'
          fill_in 'Password confirm', :with => 'secure!'
          click_button "Save"
        end
      end

    end
  end
  context "as a regular user" do
    before :each do
      @user2 = FactoryGirl.create(:user)
      visit '/auther/sign_in'
      fill_in 'user_email', :with => @user1.email
      fill_in 'Password', :with => @user1.password
      click_button "Sign in"

    end
    describe "users/index.html.haml" do
      it "Has a header" do
        page.should have_content("Wellcome to the Document Storage!")
      end
      it " has a list of users currently logged in" do

        visit '/users'
        page.should have_link(@user1.email)
        page.should have_link(@admin1.email)
        page.should have_link(@user2.email)
        page.should_not have_link("edit user")
        page.should_not have_link("delete user")
      end
    end


    describe "users/show.html.haml" do

      it "displayes profile and links to edit" do
        click_link(@user1.email)
        page.should have_content(@user1.email)
        page.should have_link("edit profile")
        page.should_not have_link("delete user")
      end  

      it "Has options for own documents" do

        doc1 = FactoryGirl.create(:document, :user => @user1)
        visit user_path(@user1)
        page.should have_content("Documents")
        page.should have_link(doc1.title)
      end

      it "has links to upload new document" do
        visit user_path(@user1)
        page.should have_link("upload document")
      end


    end
  end
end
