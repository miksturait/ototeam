class EventsController < AuthenticatedUser
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @q = events.search(params[:q])
    @events = @q.result.page(params[:page])
  end

  def show
  end

  def new
    @event = events.build
  end

  def edit
  end

  def create
    @event = events.build(event_params)

    if @event.save
      redirect_to @event, notice: t('events.create.success')
    else
      render action: 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: t('events.update.success')
    else
      render action: 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: t('events.destroy.success')
  end

  private
    def set_event
      @event = events.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:state, :name, :description, :start_at, :invite_from, :invite_to, :attendees_min_count, :attendees_max_count, :minutes_for_answer, :public_attendees_list)
    end

    def events
      current_user.events
    end
end
