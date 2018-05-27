require 'pundit'

class WikisController < ApplicationController
  
  def index
    
    @wikis = Wiki.all
    
    authorize Wiki, :index?
    
  end
 
  def show
      authorize Wiki, :index?
    @wiki = Wiki.find(params[:id])
  end

  def new
      authorize Wiki, :new?
    @wiki = Wiki.new
  end

  def create
      
    @wiki = Wiki.new
    @wiki.title = params[:title]
    @wiki.body = params[:body]
    
    authorize Wiki, :create?
    
     if @wiki.save
       flash[:notice] = "Post was saved."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error saving the Wiki. Please try again."
       render :new
     end
  end
  
  def edit
      
    @wiki = Wiki.find(params[:id])
    
     authorize Wiki, :edit?
  end

  def update
    
     @wiki = Wiki.find(params[:id])

     authorize Wiki, :update?
  
     
      @wiki.title = params[:wiki][:title]
      @wiki.body = params[:wiki][:body]
     
     if @wiki.save
       flash[:notice] = "Post was saved."
       redirect_to wiki_path
     else
       flash.now[:alert] = "There was an error saving the Wiki. Please try again."
       render :new
     end
  end


  def destroy
      
      
      
       @wiki = Wiki.find(params[:id])
 

     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_url
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end
end

