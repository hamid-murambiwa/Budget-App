class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = @user.groups
  end

  def new
    @user = current_user
    @icons = icons
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.user_id = @user.id
    if @group.save
      redirect_to user_groups_path(@user.id)
      flash[:success] = 'Category has been successfully created!'
    else
      flash[:success] = 'Something went wrong. Please try again'
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

  def icons
    {
      'Housing' => 'https://user-images.githubusercontent.com/71644515/171569812-9b1fb73c-31fc-4de5-81be-9a21424825b7.png',
      'Transportation' => 'https://user-images.githubusercontent.com/71644515/171570628-bbd26898-0f60-4a42-b37d-df9b6d72a303.png',
      'Education' => 'https://user-images.githubusercontent.com/71644515/171570835-d9d8c138-95a2-46fd-bab8-1aac5a758de7.png',
      'Bills' => 'https://user-images.githubusercontent.com/71644515/171570981-dd9ca216-78cc-45df-8963-755b02f17cdf.png',
      'Food' => 'https://user-images.githubusercontent.com/71644515/171571279-fe5cdb27-df8d-4763-afb2-8c44b768251c.png',
      'Utilities' => 'https://user-images.githubusercontent.com/71644515/171571693-bc272b67-401d-4d9c-a58e-b743eb889e8e.png',
      'Insurance' => 'https://user-images.githubusercontent.com/71644515/171572053-b998db8f-554a-49e7-9701-2af3c2bdb0ab.png',
      'Savings' => 'https://user-images.githubusercontent.com/71644515/171572350-e4b07673-7b60-4c7e-82e4-501801e6e2c1.png'
    }
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
