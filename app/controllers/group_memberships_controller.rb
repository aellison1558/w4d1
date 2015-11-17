class GroupMembershipsController < ApplicationController
  def create
    group_membership = GroupMembership.new(group_membership_params)
    if group_membership.save
      render json: group_membership
    else
      render json: group_membership.errors.ful_messages, status: :unprocessable_entity
    end
  end

  def destroy
    group_membership = GroupMembership.find_by(id: params[:id])
    if group_membership.destroy
      render json: group_membership
    else
      render json: "Cannot destroy what does not exist"
    end
  end

  private
  def group_membership_params
    params[:group_membership].permit(:contact_id, :group_id)
  end
end
