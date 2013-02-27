require 'spec_helper'

describe DocumentsController do
  pending("some passing user stuff")

  before :each do 
    @doc1 = FactoryGirl.build(:user)
  end
  describe "GET new" do
    it "creates a new docment instace at the user" do
      get :new
    end

  
  end
    # describe "POST create" do
    #   context "with valid attributes" do
    #     it "creates a new user" do
    #       expect{
    #         post :create, user: FactoryGirl.attributes_for(:user)
    #       }.to change(User,:count).by(1)
    #     end

    #     it "redirects to the new user" do
    #       post :create, user: FactoryGirl.attributes_for(:user)
    #       response.should redirect_to User.last
    #     end
    #   end
    # end
    # describe "GET #index" do
    #   it "populates an array of users" do
    #     user = FactoryGirl.create(:user)
    #     get :index
    #     assigns(:users).should eq([user])
    #   end

    #   it "renders the :index view" do
    #     get :index
    #     response.should render_template :index
    #   end
    # end
  # end


  # describe "GET #show" do
  # it "assigns the requested user to @user" do
  #   user = FactoryGirl.create(:user)
  #   get :show, id: user
  #   assigns(:user).should eq(user)
  # end
  
  # it "renders the #show view" do
  #   get :show, id: FactoryGirl.create(:user)
  #   response.should render_template :show
  # end
# end

  # describe 'PUT update' do
  #   before :each do
  #     @user = FactoryGirl.create(:user, email: "just@temp.com", password: "goodone")
  #   end
  #   context "valid attributes" do
  #     it "located the requested @user" do
  #       put :update, id: @user, user: FactoryGirl.attributes_for(:user)
  #       assigns(:user).should eq(@user)      
  #     end

  #     it "changes @user's attributes" do
  #       put :update, id: @user, 
  #         user: FactoryGirl.attributes_for(:user, email: "get@it.here", password: "Wonder")
  #       @user.reload
  #       @user.email.should eq("get@it.here")
  #       @user.password.should eq("Wonder")
  #     end

  #     it "redirects to the updated user" do
  #       put :update, id: @user, user: FactoryGirl.attributes_for(:user)
  #       response.should redirect_to @user
  #     end
  #   end

  #   context "invalid attributes" do
  #     it "locates the requested @user" do
  #       put :update, id: @user, user: FactoryGirl.attributes_for(:user, email:"get@it.here", password: nil)
  #       assigns(:user).should eq(@user)      
  #     end

  #     it "does not change @user's attributes" do
  #       put :update, id: @user, 
  #         user: FactoryGirl.attributes_for(:user, email:"get@it.here", password: nil)
  #       @user.reload
  #       @user.email.should_not eq("get@it.here")  
  #       @user.password.should eq("goodone")
  #     end

  #     it "re-renders the edit method" do
  #       put :update, id: @user, user: FactoryGirl.attributes_for(:user, email: nil, password: 'wow')
  #       response.should render_template :edit
  #     end
  #   end
  # end
  # describe "The destroy delete aciton"do
  #   before :each do
  #     @user = FactoryGirl.create(:user)
  #   end
    
  #   it "deletes a user" do
  #     expect{
  #       delete :destroy, id: @user
  #     }.to change(User,:count).by(-1)
  #   end

  #   it "redirects to index" do

  #     delete :destroy, id: @user

  #     response.should render_template :index
  #   end
  # end
end

