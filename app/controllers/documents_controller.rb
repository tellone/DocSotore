class DocumentsController < ApplicationController
  before_filter :get_user
  before_filter :get_document, :only => [:show] 

  def new
    @document = @user.documents.build
  end

  def index
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
    @document = Document.find(params[:id])
  end
  
  def show

  end
  
  def update  
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:user])
      flash[:notice] = "Update Complete"
      redirect_to @document
    else
      flash[:notice] = "Update Failed"
      render :action => "edit"
    end
  end

  def destroy
    @document = document.find(params[:id])
    @document.destroy
    flash[:notice] = "document deleted."
    redirect_to documents_path 
  end

  private #get_user should not be called outside contoller
  def get_user
    @user = User.find(params[:user_id])
  end
  private
  def get_document
    @document=@user.documents.find(params[:id])
  end
end
