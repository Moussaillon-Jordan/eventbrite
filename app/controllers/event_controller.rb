class EventController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

   private

   def authenticate_user
     unless current_user
       flash[:danger] = "Connecte toi avant !"
       redirect_to new_user_session_path
     end
   end


  def index
  end

  def show
  end

  def new
    Event.new
  end

    def create
      @event = Event.new(title: params[:title], description: params[:description], price: params[:price], start_date: params[:start_date], duration: params[:duration], location: params[:location], orga_id: current_user.id)
      if @event.save
        flash[:success] = 'Votre event a bien été créé'
        render 'index'
      else
        flash[:alert] = 'Votre event a bien été créé'
        render 'new'
      end
    end

end
