require 'spec_helper'

describe DocumentsController do
  # pending("some passing user stuff")

  before :each do 

    @user1 = FactoryGirl.create(:user)
    @doc1 = FactoryGirl.create(:document, :user => @user1)
  end


  describe "get new" do
    it "creates a new instace withou saving" do
      expect{
        get :new, :user_id => @user1.id
      }.to_not change(Document,:count)
    end
  end
  describe "Post create" do
    it "creates a new document at the user" do
      expect{
        post :create, :user_id => @user1.id, document: FactoryGirl.attributes_for(:document, user: @user1) 
      }.to change(Document, :count).by(1)
    end 

    it "redirects to the new user" do
      pending("show")
      post :create, :user_id => @user1.id, document: FactoryGirl.attributes_for(:document, user: @user1) 
      response.should redirect_to @user1.documents.last 
    end
  end
    describe "GET #index" do
      it "populates an array of users" do
        get :index, :user_id => @user1.id
        assigns(:documents).should eq([@doc1])
      end

      it "renders the :index view" do
        get :index, :user_id => @user1.id 
        response.should render_template :index
      end
    end
  # end


  describe "GET #show" do
  it "assigns the requested user to @user" do
    get :show, :user_id => @user1.id, id: @doc1
    assigns(:document).should eq(@doc1)
  end
  
  it "renders the #show view" do
    get :show, :user_id => @user1.id, id: @doc1
    response.should render_template :show
  end
end

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

