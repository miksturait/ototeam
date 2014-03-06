class EventsController < AuthenticatedUser
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @q = Event.search(params[:q])
    @events = @q.result.page(params[:page])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:state, :name, :description, :start_at, :invite_from, :invite_to, :attendees_min_count, :attendees_max_count, :minutes_for_answer, :public_attendees_list, :creator_id)
    end
end
