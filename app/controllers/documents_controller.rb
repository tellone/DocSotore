class DocumentsController < ApplicationController

  def index
   @documents = Document.all 
  end

  def create
    @document = Document.new(params[:user])
    @document.save
    
    flash[:notice] = "Project has been created."
    redirect_to @document 
  end
  
  def edit
    @document = Document.find(params[:id])
  end
  
  def show
    @documents = Document.find(params[:id])
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
end
