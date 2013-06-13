class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

def create
    @category = current_user.categories.build(params[:category])
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/help'
    end
  end
  
  def index
    @categories = current_user.categories.find(params[:id])
  end
  
  def destroy
    @category.destroy
    redirect_to root_url
  end

  private
  
    def correct_user
      @category = current_user.categorys.find_by_id(params[:id])
      redirect_to root_url if @category.nil?
    end
end