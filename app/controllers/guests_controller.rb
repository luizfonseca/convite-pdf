require 'barby'
require 'barby/code_25'

class GuestsController < ApplicationController

  def new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      flash[:notice] = "Ok dok, salvamos!"
      redirect_to root_path
    else
      flash[:notice] = "Nope!"
      redirect_to root_path
    end
  end

  def show
  end


  def guest_params
    params.require(:guest).permit(:name, :email, :phone)
  end
end
