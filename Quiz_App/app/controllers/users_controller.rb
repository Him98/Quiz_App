class UsersController < ApplicationController

  def index
    if cur_user.admin_mode
		  @users=User.all
      @genres=Genre.all
    else
      flash[:error] = 'Access Denied'
    end
  end

  def show
  	@user=User.find(params[:id])
    @genres=Genre.all
  end

  def destroy
    if cur_user.admin_mode
      User.find_by(id: params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to "/users"
    else
      flash[:error]="Access Denied"
    end
  end

  def new
  	@user=User.new
  end

  def edit
    if cur_user.admin_mode
      @user = User.find(params[:id])
    end
  end

  def update
    if cur_user.admin_mode
      @user = User.find(params[:id])
      if @user.update_attributes(params.require(:user).permit(:name,:email,:password,:password_confirmation))
        redirect_to "/users/"
      else
        render 'edit'
      end
    end
  end        

  def create
  	@user = User.new(params.require(:user).permit(:name,:email,:password,:password_confirmation))
  	if @user.save
  		redirect_to '/login'
  	else
  		redirect_to "/users/new"
  	end
  end

  def leaderboard
    @genreName = params[:genreName]
    @leaders = Leaderboard.order("score DESC")
  end
end
