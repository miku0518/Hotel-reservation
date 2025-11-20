class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @room.reservations.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to @reservation, notice: "予約が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
 
  def index
    @reservations = current_user.reservations.includes(:room)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :people)
  end
end

