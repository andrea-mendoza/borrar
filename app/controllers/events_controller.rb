class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where(:career => current_user.career)
  end

  # GET /events/1
  # GET /events/1.json
  # Method Show without implementation.
  # Implement Show Method



  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  # Method Edit without implementation
  # Implement Edit method


  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

      if @event.save
        redirect_to events_path
      else
        render :new
      end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
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
      params.require(:event).permit(:semester, :year, :name, :limit_date, :career)
    end
end
