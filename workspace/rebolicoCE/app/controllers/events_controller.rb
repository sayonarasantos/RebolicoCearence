class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
 
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @users = User.all
    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.all.order('created_at DESC')
    end
    
    
    
    
                                  # i=0
                                  # while i<@events.size
                                  #   @userID = @events[i].user_id
                                  #   @userName[i]=@users.find_by(id: @userID)
                                  #   i=i+1
                                  # end
  end
  
  
  
  # GET /events/1
  # GET /events/1.json
  
	def show
    
    @events = Event.find(params[:id])
    # @user = User.find(params[:id])
    # @events = @user.events
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Evento criado com sucesso!' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Evento atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Evento removido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :address, :neighborhood, :city, :state, :cep, :eventdate, :eventtime, :price, :user_id)
    end
end
