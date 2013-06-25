class PiecesController < ApplicationController
  #before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: :destroy

def create
    @piece = current_user.pieces.build(params[:piece])
    if @piece.save
      flash[:success] = "Piece created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/privacy'
    end
    
    #Added this for paperclip
    @photo = Piece.new(params[:photo])
    if @photo.save
    redirect_to :action => :show, :id => @photo.id
    end   
    
  end
  
  def index
    @pieces = Piece.paginate(page: params[:page])

    
    #Added this fo paperclip
    #@id = params[:id]
    #@photo = Piece.find(@id)
    
  end
  
  def destroy
    @piece.destroy
    redirect_to root_url
  end
  
  def upload
    uploaded_io = params[:theme][:photo]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
  end
  
  def show
    @piece = Piece.find(params[:id])
    
    #@user = User.find(params[:id])
    @user = @piece.user
    #@theme = Theme.find(params[:id])
    
    #@microposts = @user.microposts.paginate(page: params[:page])
    #@categories = @user.categories.paginate(page: params[:page])
    #@themes = @user.themes.paginate(page: params[:page])
    #@pieces = @user.pieces.paginate(page: params[:page])
  end

  def recent
    #@pieces = Piece.all
    
    @pieces = Piece.find(:all)


  end

  private
  
    def correct_user
      @piece = current_user.pieces.find_by_id(params[:id])
      redirect_to root_url if @piece.nil?
    end
end