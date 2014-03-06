class FriendsController < AuthenticatedUser
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def index
    @q = Friend.search(params[:q])
    @friends = @q.result.page(params[:page])
  end

  def show
  end

  def new
    @friend = Friend.new
  end

  def edit
  end

  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      redirect_to @friend, notice: 'Friend was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @friend.update(friend_params)
      redirect_to @friend, notice: 'Friend was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @friend.destroy
    redirect_to friends_url, notice: 'Friend was successfully destroyed.'
  end

  private
    def set_friend
      @friend = Friend.find(params[:id])
    end

    def friend_params
      params.require(:friend).permit(:fullname, :email, :phone)
    end
end
