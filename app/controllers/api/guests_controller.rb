class Api::GuestsController < ApplicationController



  def update 
    @guest = Guest.find_by barcode: params[:id]

    render json: {}, status: :ok if @guest.present?
    render json: {}, status: :unprocessable_entity unless @guest.present?
  end


  def show

  end

end
