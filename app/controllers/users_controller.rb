class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    if params[:approved] == "false"
      @users = User.all
    end
  end

  def approve
    @user = User.find(params[:id])
    @user.update_attribute(:approved, 'true')
    redirect_to @user
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
     if @user.save
    
      flash[:notice] = "Project has been created."
      redirect_to @user 
     else
       flash[:notice] = "Failed to create user"
       render :action => :new
     end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update  
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Update Complete"
      redirect_to @user
    else
      flash[:notice] = "Update Failed"
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to root_url
  end
end
