require 'spec_helper'

describe "documents urls" do
  context "as an admin " do
    before :each do
      @admin1 = create(:admin)
      @user1 = FactoryGirl.create(:user)
      @doc1 = FactoryGirl.create(:document, :user => @user1)
      
    end
  describe "docuements/new.html.haml" do
    it "has displays all document allowed to be viewed" do
      # pending "routes to documents"

      visit user_path(@user1)
      click_link("upload document")
    end
  end
end
end
