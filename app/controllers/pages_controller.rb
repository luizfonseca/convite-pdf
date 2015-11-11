class PagesController < ApplicationController
  def index
    @guest = Guest.new 
  end
end
