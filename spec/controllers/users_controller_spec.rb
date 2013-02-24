require 'spec_helper'

describe UsersController do
 describe "User Create" do
   before :each do 
     @user = mock_model(User)
   end
 
   it "crates a new user" do
     pending("a mock model nice")
     User.should_receive(:new).with.("string" => "CaptianObvious@obv.se").and_return(@user)
      post :create, user => { "email" => "CaptianObvious@obv.se"}
  end
   
   it "saves the user" do
      User.stub(:new).and_return(@user)
      @user.should_receive(:save)
      post :create
   end
   it "rediracts to index" do
     post :create
     response.should redirect_to( :action => "index")
   end
 end
  describe "User index" do
    it "find all the users" do
      pending('do I need this?')
    end
  end
    
end
