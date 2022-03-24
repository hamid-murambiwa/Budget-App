class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = @user.groups
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.user_id = @user.id
    if @group.save
      redirect_to user_groups_path(@user.id)
      flash[:success] = 'Category has been successfully created!'
    else
      print 'Something went wrong'
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @proceedings = Proceeding.where(group_id: params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @proceedings = Proceeding.where(group_id: params[:id])
    @proceedings.each(&:destroy)
    @group.destroy!
    redirect_to user_groups_path
    flash[:success] = 'Group was deleted!'
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
