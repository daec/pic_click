class PicturesController < ApplicationController
  before_filter :load_picture, :only => [:show, :update, :edit, :destroy]
  
  def index
    @pictures = Picture.all
  end
  
  def new
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(params[:picture])
    if @picture.save
      flash.now[:notice] = "New picture saved"
    else
      flash.now[:error] = "Could not save picture"
      render :action => :new
    end
  end
  
  def show
  end
  
  def update
    if @picture.update_attributes(params[:picture])
      flash.now[:notice] = "Picture updated"
      render :action => :show
    else
      flash.now[:error] = "Could not update picture"
      render :action => :edit
    end
  end
  
  def edit
  end
  
  def destroy
    if @picture.destroy
      flash[:notice] = "Picture destroyed"
      redirect_to pictures_path
    else
      flash[:error] = "Could not destroy picture"
      redirect_to :back
    end
  end
  
  private
  
  def load_picture
    @picture = Picture.find(params[:id])
  end
end
