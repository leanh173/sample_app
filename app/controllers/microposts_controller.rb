class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy 
  skip_load_and_authorize_resource only: :show

  def new
    @micropost = Micropost.new
  end

  def index
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] ="Micropost created!"
      @micropost.to_param
      redirect_to @micropost
    else 
      @feed_iemts =[]
      render 'static_pages/home'
    end
  end
  
  def show
    @micropost = Micropost.friendly.find params[:id]
    authorize! :show, @micropost
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private 
  def micropost_params
    params.require(:micropost).permit(:content, :title)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end