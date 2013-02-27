require 'spec_helper'

describe "documents urls" do
  describe "docuements/new.html.haml" do
    before :each do
      @user1 = FactoryGirl.create(:user)
      @doc1 = FactoryGirl.create(:document)
    end
    it "has displays all document allowed to be viewed" do
      # pending "routes to documents"
      visit user_path(@user1)
      click_link("upload document")
    end
  end
end
