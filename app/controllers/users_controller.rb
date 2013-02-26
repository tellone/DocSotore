class UsersController < ApplicationController
  def index
   @users = User.all 
  end

  def create
    @user = User.new(params[:user])
    @user.save
    
    flash[:notice] = "Project has been created."
    redirect_to @user 
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
    render :action => :index
  end
end
