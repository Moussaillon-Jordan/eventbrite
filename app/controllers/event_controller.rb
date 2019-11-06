class EventController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

   def authenticate_user
     unless current_user
       flash[:danger] = "Connecte toi avant !"
       redirect_to new_user_session_path
     end
   end


  def index
    @images = ['https://blackwhite.pictures/public/uploads/thumbnail/blackwhite-photography-36271549213698klqcoxfiqq.jpeg', 'https://www.letelegramme.fr/images/2019/10/17/le-bunker-brestois-grand-messe-de-la-scene-electro-local_4862281_495x330p.jpg?v=1', 'http://studio-spaces.com/wp-content/uploads/2016/09/2_StudioSpaces_Events_Wedding_03.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvz75lpxAuMhrm1NCV41VDDU00bIQ8N_rn8ky281kWcpoM2EgO', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRcuaAyWCW4biOA-C8BQ9e_Pi73X53nCkamqz4oYUf_5FaloHCg', 'https://apiumhub.com/wp-content/uploads/2017/01/become-a-software-developer.jpg']
  end

  def show
  end

  def new
    Event.new
  end

    def create
          @images = ['https://blackwhite.pictures/public/uploads/thumbnail/blackwhite-photography-36271549213698klqcoxfiqq.jpeg', 'https://www.letelegramme.fr/images/2019/10/17/le-bunker-brestois-grand-messe-de-la-scene-electro-local_4862281_495x330p.jpg?v=1', 'http://studio-spaces.com/wp-content/uploads/2016/09/2_StudioSpaces_Events_Wedding_03.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvz75lpxAuMhrm1NCV41VDDU00bIQ8N_rn8ky281kWcpoM2EgO', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRcuaAyWCW4biOA-C8BQ9e_Pi73X53nCkamqz4oYUf_5FaloHCg', 'https://apiumhub.com/wp-content/uploads/2017/01/become-a-software-developer.jpg']
          
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
