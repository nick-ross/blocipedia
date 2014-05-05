class WikisController < ApplicationController
  def index
    @wikis = Wiki.visible_to current_user
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize! :create, Wiki
  end

  def create
    @wiki = current_user.wikis.build(params[:wiki])
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    title = @wiki.title
    authorize! :destroy, @wiki, message: "You need to own that Wiki to delete it."
    if @wiki.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    authorize! :edit, @wiki, message: "You need to own the wiki to do edit it."

  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end
end
