class GroupsController < ApplicationController
    def index
        @user = current_user
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
        else
            print 'Something went wrong'
            render :new
        end
    end

    private

    def group_params
      params.require(:group).permit(:name, :icon)
    end
end
