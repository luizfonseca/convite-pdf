require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

class GuestsController < ApplicationController

  def new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      flash[:notice] = "Ok dok, salvamos! Seu código é #{@guest.barcode}. https://evento-coca-convites.herokuapp.com/convite/#{@guest.barcode}.pdf"
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
      
      @barcode = Barby::Code128B.new(@guest.barcode)

      blob = Barby::PngOutputter.new(@barcode) #Raw PNG data
      blob.xdim = 6
      blob.ydim = 3
      tempfile = Tempfile.open(["#{@guest.barcode}", ".png"], Rails.root.join('tmp'), encoding: 'ascii-8bit')

      tempfile.write blob.to_png
      tempfile.close

      @file = tempfile.path 


      respond_to do |format|
        format.html
        format.pdf do
          if params[:download]
            @pdf = render_to_string pdf: @guest.name, encoding: 'UTF-8', template: 'guests/show'
            send_data(@pdf, filename: "#{@guest.name}.pdf", type: 'application/pdf')
          else
            render pdf: @guest.name
          end
        end
      end
    end
  end



  def guest_params
    params.require(:guest).permit(:name, :email, :phone)
  end
end
