class EventsController < ApplicationController
  before_action :set_entertainer, only: [:show, :index, :destroy]
  before_action :set_event, only: [:show, :destroy]
  before_action :set_events, only: :index

  # GET /entertainers/:entertainer_id/events
  # GET /entertainers/:entertainer_id/events.json
  def index
    respond_to do |format|
      format.html
      format.json {
        render json: {
          entertainer: @entertainer,
          events: @events
        }
      }
    end
    # authorize! :index, @events
  end


  # GET /entertainers/:entertainer_id/events/:id
  # GET /entertainers/:entertainer_id/events/:id.json
  def show
    respond_to do |format|
      format.html
      format.json {
        render json: {
          entertainer: @entertainer,
          event: @event
        }
      }
    end
  end

  # GET /entertainers/:entertainer_id/events/new
  def new
    @event = Event.new
  end

  # GET /entertainers/:entertainer_id/events/:id/edit
  def edit
  end

  # DELETE /entertainers/:entertainer_id/events/:id
  # DELETE /entertainers/:entertainer_id/events/:id.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

 def set_events
   @events = Event.where(user_id: @entertainer.id).order(created_at: :desc)
 end

  def set_entertainer
    @entertainer = User.find_by(name: params[:entertainer_id]) || User.find(params[:entertainer_id])
  end
end
