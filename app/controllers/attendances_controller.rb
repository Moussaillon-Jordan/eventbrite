class AttendancesController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

   def authenticate_user
     unless current_user
       flash[:danger] = "Connecte toi avant !"
       redirect_to new_user_session_path
     end
   end

  def new
    Attendance.new
  end

  def create
    @attendance = Attendance.new(event_id: params[:title], user_id: current_user.id)
    if @attendance.save
      flash[:success] = 'Votre participation est prise en compte'
      redirect_to root
    else
      flash[:alert] = 'Un problème est survenu, veuillez réessayer'
      render 'new'
    end
  end
end
