class FriendsController < AuthenticatedUser
  expose(:friends, ancestor: :current_user)
  expose(:friend, attributes: :friend_params)
  expose(:search) { friends.search(params[:q]) }
  expose(:filtered_friends) { search.result.page(params[:page]) }

  def create
    if friend.save
      redirect_to friend, notice: t('friends.create.success')
    else
      render action: 'new'
    end
  end

  def update
    if friend.save
      redirect_to friend, notice: t('friends.update.success')
    else
      render action: 'edit'
    end
  end

  def destroy
    friend.destroy
    redirect_to friends_url, notice: t('friends.destroy.success')
  end

  private

  def friend_params
    params.require(:friend).permit(:fullname, :email, :phone, {group_ids: []})
  end
end
