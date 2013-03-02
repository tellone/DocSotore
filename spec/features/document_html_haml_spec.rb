require 'spec_helper'

describe "documents urls" do
    before :each do
      @admin1 = create(:admin)
      @user1 = FactoryGirl.create(:user)
      @doc1 = FactoryGirl.create(:document, :user => @user1)
      visit "/users/sign_in"
      fill_in 'user_email', :with => @admin1.email
      fill_in 'Password', :with => @admin1.password
      click_button "Sign in"
    end

    describe "documents/index.html.haml" do
      before :each do        
        doc2 = FactoryGirl.create(:document, :user => @admin1)
        click_link("All documents")
      end
      it "list documents" do
        page.should have_link(@doc1.title)
      end

    end
    describe "document/show.html.haml"do
      before :each do
        visit [@user1, @doc1]
    describe "docuements/new.html.haml" do


      it "displayes the new document form" do
        pending "routes to documents"

      end
    end
  end

