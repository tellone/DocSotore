class DocumentsController < ApplicationController
  before_filter :get_user
  before_filter :get_document, :only => [:show, :update, :edit, :destroy] 
  load_and_authorize_resource

  def new
    @document = @user.documents.build
  end

  def index
    if params[:tag]
      @documnets = Document.tagged_with(params[:tag])
    else
      @documents = Document.all
    end

  def create
    @document = @user.documents.build(params[:document])
    if @document.save
      flash[:notice] = "Document has been created."
      redirect_to [@user, @document]
    else
      flash[:notice] = "Failed to create document."
      render :action => "new"
    end
  end
  
  def edit

  end
  
  def show

  end
  
  def update  
    if @document.update_attributes(params[:document])
      flash[:notice] = "Update Complete"
      redirect_to [@user, @document]
    else
      flash[:notice] = "Update Failed"
      render :action => "edit"
    end
  end

  def destroy
    @document.destroy
    flash[:notice] = "document deleted."
    redirect_to @user
  end

  private #get_user should not be called outside contoller
  def get_user
    @user = User.find(params[:user_id])
  end
  private
  def get_document
    @document = @user.documents.find(params[:id])
  end
end
