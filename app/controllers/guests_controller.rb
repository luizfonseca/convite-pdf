require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

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
    unless params[:barcode].present?

      @guest = Guest.find_by barcode: params[:id] 
     
      redirect_to root_path if @guest.nil?
      
      @barcode = Barby::Code128B.new('FRANGO')

      blob = Barby::PngOutputter.new(@barcode).to_png #Raw PNG data
      @file = Tempfile.open(["#{@guest.barcode}", ".png"], Rails.root.join('tmp'), encoding: 'ascii-8bit') do |f| 
        f.write blob 
      end

      respond_to do |format|
        format.pdf do
          render pdf: @guest.name
        end
      end
    end
  end



  def guest_params
    params.require(:guest).permit(:name, :email, :phone)
  end
end
