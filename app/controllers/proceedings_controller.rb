class ProceedingsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
  end

  def create
    @proceeding = Proceeding.new(proceeding_params)
    @proceeding.user_id = current_user.id
    @proceeding.group_id = params[:group_id]

    if @proceeding.save
        redirect_to user_group_path(current_user.id, @proceeding.group_id)
        flash[:success] = 'Transaction has been successfully created!'
    else
        render :new
        flash[:message] = 'Transaction failed to create. Please try again!'
    end
  end

  def destroy
    @proceeding = Proceeding.find(params[:id])
    @proceeding.destroy!
    redirect_to user_group_path
    flash[:success] = 'Transaction was deleted!'
  end

  private

  def proceeding_params
    params.require(:proceeding).permit(:name, :amount)
  end
end
