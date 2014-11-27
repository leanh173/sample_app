class UsersController < ApplicationController
  before_action :sign_in_user, only: [:edit, :update, :following , :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  skip_load_and_authorize_resource only: [:new, :create]

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 5)
    @usersall = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 5)
    @usersall = @user.followers
    render 'show_follow'
  end

  def index
    @users =User.paginate(page: params[:page],:per_page => 5)
  end
  def new
  	@user=User.new
  end
  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page],:per_page => 5)

  end
  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the Sample App"
  		redirect_to @user
  	else
  		render 'new'
  	end	
  end
  def edit
    #@user = User.find(params[:id])
  end
  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private 
    def sign_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

  	def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    def admin_user
        unless current_user.admin
         redirect_to root_url
         end 
    end
end
