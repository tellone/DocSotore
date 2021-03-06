require 'spec_helper'

describe DocumentsController do
  context "as an admin" do 
    before :each do 

      @admin1 = FactoryGirl.create(:admin)
      @doc1 = FactoryGirl.create(:document, :user => @admin1)
      sign_in @admin1
    end


    describe "get new" do
      it "creates a new instace withou saving" do
        expect{
          get :new, :user_id => @admin1.id
        }.to_not change(Document,:count)
      end
    end
    describe "Post create" do
      it "creates a new document at the user" do
        expect{
          post :create, :user_id => @admin1.id, document: FactoryGirl.attributes_for(:document, user: @admin1) 
        }.to change(Document, :count).by(1)
      end 

      it "redirects to the user" do
        post :create, :user_id => @admin1.id, document: FactoryGirl.attributes_for(:document, user: @admin1) 
        response.should redirect_to [@admin1, assigns(:document)]
      end
    end
    describe "GET #index" do
      it "populates an array of users" do
        get :index, :user_id => @admin1.id
        assigns(:documents).should eq([@doc1])
      end

      it "renders the :index view" do
        get :index, :user_id => @admin1.id 
        response.should render_template :index
      end
    end


    describe "GET #show" do
      it "assigns the requested user to @user" do
        get :show, :user_id => @admin1.id, id: @doc1
        assigns(:document).should eq(@doc1)
      end

      it "renders the #show view" do
        get :show, :user_id => @admin1.id, id: @doc1
        response.should render_template :show
      end
    end

    describe 'PUT update' do
      before :each do
        @doc2 = FactoryGirl.create(:document, user: @admin1, title: "NoThisOne")
      end

      context "valid attributes" do

        it "changes @user's attributes" do
          put :update, :user_id=> @admin1.id, id: @doc2, document:  FactoryGirl.attributes_for(:document, :user => @admin1)
          @doc2.reload
          @doc2.title.should eq("publish")
        end

        it "redirects to the updated user" do
          put :update, :user_id=> @admin1.id, id: @doc2, document:  FactoryGirl.attributes_for(:document, :user => @admin1)
          response.should redirect_to [@admin1, @doc2]
        end
      end


      context "invalid attributes" do
        it "locates the requested @user" do
          put :update, :user_id=> @admin1.id, id: @doc2, document:  FactoryGirl.attributes_for(:error_doc, :user => @admin1)
          assigns(:document).should eq(@doc2)      
        end

        it "does not change @user's attributes" do
          put :update, :user_id=> @admin1.id, id: @doc2, document:  FactoryGirl.attributes_for(:error_doc, :user => @admin1)
          @doc2.reload
          @doc2.title.should_not eq("publish")  
        end

      end
    end
    describe "The destroy delete aciton"do

      it "deletes a document" do
        expect{
          delete :destroy, :user_id => @admin1.id, id: @doc1
        }.to change(Document,:count).by(-1)
      end

      it "redirects to index" do

        delete :destroy, :user_id => @admin1.id, id: @doc1

        response.should render_template @user
      end
    end
  end


  context "As a regular user" do
    before :each do 

      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:admin)
      @doc1 = FactoryGirl.create(:document, :user => @user1)
      @doc2 = FactoryGirl.create(:document, :user => @user2)
      sign_in @user1
    end


    describe "he can" do

      it "access action new" do
        expect{
          get :new, :user_id => @user1.id
        }.to_not change(Document,:count)
      end

      it "access action create" do
        expect{
          post :create, :user_id => @user1.id, document: FactoryGirl.attributes_for(:document, user: @user1) 
        }.to change(Document, :count).by(1)
      end 

      it "can do index" do
        get :index, :user_id => @user1.id
        assigns(:documents).should eq([@doc1, @doc2])
      end
       
      it "read documents he own" do
        get :show, :user_id => @user1.id, id: @doc1
        assigns(:document).should eq(@doc1)
      end
      
    end
    describe "get access error when" do

      it "tries to update someone elses document" do
        expect{
          put :update, :user_id => @user2.id, id: @doc2.id, document: FactoryGirl.attributes_for(:document, title: "Not this one")
        }.to raise_error(CanCan::AccessDenied)
      end 


      it "when deletes is called" do
        expect{
          delete :destroy, :user_id => @user1.id, id: @doc1 
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
