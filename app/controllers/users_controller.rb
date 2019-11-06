class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  before_action:user_is_myself, only: [:show]

  def authenticate_user
    unless current_user
      flash[:danger] = 'Connecte toi avant !'
      redirect_to new_user_session_path
    end
  end

  def user_is_myself
    unless current_user == User.find(params[:id])
      redirect_to root_path
    end
  end

  def show
    @user=User.find(params[:id])
  end

end
