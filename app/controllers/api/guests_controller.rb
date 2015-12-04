class Api::GuestsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  respond_to :json


  def index
    @guests = Guest.all
    render json: @guests, status: :ok
  end

  def update 
    
    @guest = Guest.find_by barcode: params[:id]
    
    if @guest.present?
      @guest.update_attribute(:checked_at, Time.now) if @guest.checked_at.blank?
      render json: { name: @guest.name, group: @guest.group, checkin_at: @guest.checked_at.strftime('%H:%M') }, status: :ok
    else
      render json: {}, status: :unprocessable_entity 
    end


  end


  def show

  end

end
