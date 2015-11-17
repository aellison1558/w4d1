class GroupsController < ApplicationController
  def index
    groups = User.find_by(id: params[:user_id]).groups
    my_groups = {}
    groups.each do |group|
      my_groups[group.name] = group.contacts
    end
    render json: my_groups
  end

  def create
    group = Group.new(group_params)
    if group.save
      render json: group
    else
      render json: group.errors.ful_messages, status: :unprocessable_entity
    end
  end

  def destroy
    group = Group.find_by(id: params[:id])
    if group.destroy
      render json: group
    else
      render json: "Cannot destroy what does not exist"
    end
  end

  private
  def group_params
    params[:group].permit(:name, :user_id)
  end
end
