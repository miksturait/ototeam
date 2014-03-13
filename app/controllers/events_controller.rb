class EventsController < AuthenticatedUser
  expose(:events, ancestor: :current_user)
  expose(:event, attributes: :event_params)
  expose(:search){ events.search(params[:q]) }
  expose(:filtered_events){ search.result.page(params[:page]) }
  expose(:decorated_events) { filtered_events.decorate }

  def create
    if event.save
      redirect_to event, notice: t('events.create.success')
    else
      render action: 'new'
    end
  end

  def update
    if event.save
      redirect_to event, notice: t('events.update.success')
    else
      render action: 'edit'
    end
  end

  def destroy
    event.destroy
    redirect_to events_url, notice: t('events.destroy.success')
  end

  private

  def event_params
    params.require(:event).permit(:state, :name, :description, :start_at, :invite_from, :invite_to, :attendees_min_count, :attendees_max_count, :minutes_for_answer, :public_attendees_list)
  end
end
