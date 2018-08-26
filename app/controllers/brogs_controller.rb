class BrogsController < ApplicationController
  #before_action :move_to_index, except: :index
  before_action :move_to_index, :except => [:index,:show]
  def index
    #@brogs = Brog.order("created_at DESC").page(params[:page]).per(5)
     @brogs = Brog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @brog = Brog.new
  end

  def create
      #Brog.create(brog_params)
      Brog.create(title: brog_params[:title], text: brog_params[:text], user_id: current_user.id)
  end
  def destroy
      brog = Brog.find(params[:id])
      brog.destroy if brog.user_id == current_user.id
  end
  def edit
      @brog = Brog.find(params[:id])
  end
  def update
      brog = Brog.find(params[:id])
      brog.update(brog_params) if brog.user_id == current_user.id
  end
   def show
    @brog = Brog.find(params[:id])
    @comments = @brog.comments.includes(:user)
  end

    private
    def brog_params
      params.require(:brog).permit(:title, :text)
    end
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
