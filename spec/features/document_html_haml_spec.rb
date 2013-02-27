require 'spec_helper'

describe "documents urls" do
  describe "docuements/new.html.haml" do
    before :each do
      @user1 = FacoryGirl.create(:user)
      @doc1 = FacoryGirl.create(:document)
    end
    it "has displays all document allowed to be viewed" do
      # pending "routes to documents"
      visit 'users/documents'
    end
  end
end
