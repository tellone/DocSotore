require 'spec_helper'

describe UsersController do
  context "as an admin"do

    before :each do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end
    describe "Get :new" do
      it "creates a new instace withou saving" do
        expect{
          get :new 
        }.to_not change(User,:count)
      end
    end


    describe "POST create" do
      context "with valid attributes" do
        it "creates a new user" do
          expect{
            post :create, user: FactoryGirl.attributes_for(:user)
          }.to change(User,:count).by(1)
        end

        it "redirects to the new user" do
          post :create, user: FactoryGirl.attributes_for(:user)
          response.should redirect_to User.last
        end
      end

      context "with invaild attributes" do
        it "does not save the new contact" do
          expect{
            post :create, user: FactoryGirl.attributes_for(:error_user)
          }.to_not change(User,:count)
        end

        it "re-renders the new method" do
          post :create, contact: FactoryGirl.attributes_for(:error_user)
          response.should render_template :new
        end
      end 

    end


    describe "GET #index" do
      it "populates an array of users" do
        user = FactoryGirl.create(:user)
        get :index
        assigns(:users).should eq([@admin,user])
      end

      it "renders the :index view" do
        get :index
        response.should render_template :index
      end
    end


    describe "GET #show" do
      it "assigns the requested user to @user" do
        user = FactoryGirl.create(:user)
        get :show, id: user
        assigns(:user).should eq(user)
      end

      it "renders the #show view" do
        get :show, id: FactoryGirl.create(:user)
        response.should render_template :show
      end
    end

    describe 'PUT update' do
      before :each do
        @user = FactoryGirl.create(:user, email: "just@temp.com", password: "Something_long", admin: true)
      end
      context "valid attributes" do
        it "located the requested @user" do
          put :update, id: @user, user: FactoryGirl.attributes_for(:user)
          assigns(:user).should eq(@user)      
        end

        it "changes @user's attributes" do
          put :update, id: @user, 
            user: FactoryGirl.attributes_for(:user, email: "get@it.here", password: "Something_long")
          @user.reload
          @user.email.should eq("get@it.here")
          @user.password.should eq("Something_long")
        end

        it "redirects to the updated user" do
          put :update, id: @user, user: FactoryGirl.attributes_for(:user)
          response.should redirect_to @user
        end
      end

      context "invalid attributes" do
        it "locates the requested @user" do
          put :update, id: @user, user: FactoryGirl.attributes_for(:user, email:"get@it.here", password: nil)
          assigns(:user).should eq(@user)      
        end

        it "does not change @user's attributes" do
          put :update, id: @user, 
            user: FactoryGirl.attributes_for(:user, email:"get@it.here", password: nil)
          @user.reload
          @user.email.should_not eq("get@it.here")  
          @user.password.should eq("Something_long")
        end

        it "re-renders the edit method" do
          put :update, id: @user, user: FactoryGirl.attributes_for(:user, email: nil, password: 'wow')
          response.should render_template :edit
        end
      end
    end
    describe "The destroy delete aciton"do
      before :each do
        @user = FactoryGirl.create(:user)
      end

      it "deletes a user" do
        expect{
          delete :destroy, id: @user
        }.to change(User,:count).by(-1)
      end

      it "redirects to index" do

        delete :destroy, id: @user

        response.should redirect_to root_url
      end
    end

  end

  context "as an user"do

    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    describe "Raises CanCan:AccessDenied when" do
      it "new is called" do
        expect{
          get :new 
        }.to raise_error(CanCan::AccessDenied)
      end


      it " when accessing create" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to raise_error(CanCan::AccessDenied)
      end
      it "tries to update some one elses profile" do
        user1 = FactoryGirl.create(:user)
        expect{
          put :update, id: user1.id, user: FactoryGirl.attributes_for(:user, email: "get@it.here", password: "Something_long")
        }.to raise_error(CanCan::AccessDenied)
      end 


      it "when deletes is called" do
        expect{
          delete :destroy, id: @user
        }.to raise_error(CanCan::AccessDenied)
      end
    end
    describe "no error when" do
      it "changes it own attributes" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, email: "get@it.here", password: "Something_long")
        @user.reload
        @user.email.should eq("get@it.here")
      end
    end
  end
end
