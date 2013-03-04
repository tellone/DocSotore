require 'spec_helper'

describe "documents urls" do
    before :each do
      @admin1 = create(:admin)
      @user1 = FactoryGirl.create(:user)
      @doc1 = FactoryGirl.create(:document, :user => @user1)
      visit "/auther/sign_in"
      fill_in 'user_email', :with => @admin1.email
      fill_in 'Password', :with => @admin1.password
      click_button "Sign in"
    end
    describe "documents/index.html.haml" do
      before :each do        
        @doc2 = FactoryGirl.create(:document, :user => @admin1)
        click_link("All documents")
      end
      it "list documents" do
        page.should have_link(@doc1.title)
        page.should have_link(@doc2.title)
      end
      it "has links to edit and delete" do
        page.should have_link("delete")
        page.should have_link("edit")
      end
      it "has a search filled with tag section" do
        pending "acts as tagable"
      end
    end


    describe "document/show.html.haml"do
      before :each do
        visit user_document_path(@user1, @doc1)
      end

      it "has as title as header" do
        page.should have_content(@doc1.title)
        page.should have_content("Uploded by: #{@user1.email}")
      end
      it "has as the text file" do
        pending("paperclip conf")
      end
      it "displays the tags" do
        page.should have_content("Tags: #{@doc1.tag_list}")
      end
    end
    describe "documents/new.html.haml" do

      it "displayes the new document form" do
        click_link("Upload document")
        fill_in "Title", :with => "something_new"
        fill_in "Doc file", :with => "/home/tellone/need_install.txt"
      end
   end
end
