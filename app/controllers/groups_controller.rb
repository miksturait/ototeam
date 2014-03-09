class GroupsController < AuthenticatedUser
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @q = groups.search(params[:q])
    @groups = @q.result.page(params[:page])
  end

  def show
  end

  def new
    @group = groups.build
  end

  def edit
  end

  def create
    @group = groups.build(group_params)

    if @group.save
      redirect_to @group, notice: t('groups.create.success')
    else
      render action: 'new'
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: t('groups.update.success')
    else
      render action: 'edit'
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: t('groups.destroy.success')
  end

  private
    def set_group
      @group = groups.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end

    def groups
      current_user.groups
    end
end
