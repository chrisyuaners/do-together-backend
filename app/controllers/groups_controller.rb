class GroupsController < ApplicationController
  def index
    groups = Group.all
    render json: groups
  end

  def show
    group = Group.find(params[:id])
    render json: group
  end

  def create
    group = Group.create(group_params)
    render json: group
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    render json: group
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
  end

  def remove_user
    group = Group.find(params[:group_id])
    user = User.find(params[:user_id])
    user_group = UserGroup.where(group_id: group.id, user_id: user.id)
    group.events.each { |event| event.attendees.each {|att| att.user_id == params[:user_id].to_i ? att.destroy : nil }}
    user_group.destroy_all
    
    group = Group.find(params[:group_id])

    render json: group
  end

  private

  def group_params
    params.require(:group).permit(:name, :creator, :description)
  end
end
