class ThemesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

def create
    @theme = current_user.themes.build(params[:theme])
    if @theme.save
      flash[:success] = "Theme created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/terms'
    end
  end
  
  def index
    #@themes = current_user.themes.find(params[:id])
    @themes = Theme.paginate(page: params[:page])

  end
  
  def destroy
    @theme.destroy
    redirect_to root_url
  end
  
  def show
    @theme = Theme.find(params[:id])

  end  

  private
  
    def correct_user
      @theme = current_user.themes.find_by_id(params[:id])
      redirect_to root_url if @theme.nil?
    end
end