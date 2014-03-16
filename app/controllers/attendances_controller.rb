class AttendancesController < AuthenticatedUser
  expose(:event) { current_user.events.find(params[:event_id]) }
  expose(:attendances, ancestor: :event)
  expose(:decorated_attendances) { attendances.decorate }
  expose(:attendance, attributes: :attendance_params)
  expose(:groups_with_friends)

  def create
    attendance.save
    redirect_to event_attendances_path(event), notice: t('attendances.create.success')
  end

  def destroy
    attendance.destroy
    redirect_to event_attendances_path(event), notice: t('attendances.destroy.success')
  end

  protected

  def attendance_params
    params.require(:attendance).permit(:friend_id, :state_event, :comment)
  end

  def friends(group = nil)
    (group ? group : current_user).friends.where.not(id: attendances.pluck(:friend_id)).decorate
  end

  def groups_with_friends
    current_user.groups.each_with_object(Group.new(name: 'All').decorate => friends) do |group, result|
      result[group.decorate] = friends(group)
    end
  end
end
