class FriendsController < AuthenticatedUser
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def index
    @q = friends.search(params[:q])
    @friends = @q.result.page(params[:page])
  end

  def show
  end

  def new
    @friend = friends.build
  end

  def edit
  end

  def create
    @friend = friends.build(friend_params)

    if @friend.save
      redirect_to @friend, notice: t('friends.create.success')
    else
      render action: 'new'
    end
  end

  def update
    if @friend.update(friend_params)
      redirect_to @friend, notice: t('friends.update.success')
    else
      render action: 'edit'
    end
  end

  def destroy
    @friend.destroy
    redirect_to friends_url, notice: t('friends.destroy.success')
  end

  private
    def set_friend
      @friend = friends.find(params[:id])
    end

    def friend_params
      params.require(:friend).permit(:fullname, :email, :phone, { group_ids: [] })
    end

    def friends
      current_user.friends
    end
end
