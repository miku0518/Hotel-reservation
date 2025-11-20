class RoomsController < ApplicationController
  before_action :authenticate_user! #ログイン済かを確認
  
  def index
    @rooms = Room.where(user_id: current_user.id())
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to @room, notice: "施設を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def search
    @query = params[:query]
    @area = params[:area]

    @rooms = Room.all

    if @query.present?
      @rooms = @rooms.where("hotelname LIKE ? OR hotelintoroduction LIKE ?", "%#{@query}%", "%#{@query}%")
    end

    if @area.present?
      @rooms = @rooms.where("adress LIKE ?", "%#{@area}%")
    end
  end

  private
  def room_params
    params.require(:room).permit(:hotelname, :hotelintoroduction, :price, :adress, :image)
  end
end
