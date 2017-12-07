class WelcomeController < ApplicationController
  def index
    @events = Event.all
    # if params[:search]
    #   @events = Event.search(params[:search]).order("created_at DESC")
    # else
    #   @events = Event.all.order('created_at DESC')
    # end
    
  end

  def about
  end
  
  def date_today
    @today = Date.today.strftime("%d/%m/%Y")
  end
end