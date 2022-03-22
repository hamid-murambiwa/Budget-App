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
        else
            render :new
        end
    end
    
    private

    def proceeding_params
      params.require(:proceeding).permit(:name, :amount)
    end
end
