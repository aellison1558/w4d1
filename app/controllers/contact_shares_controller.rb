class ContactSharesController < ApplicationController
  def create
    share = ContactShare.new(contact_share_params)
    if share.save
      render json: "Contact shared!"
    else
      render json: "Contact not shared!"
    end
  end

  def destroy
    share = ContactShare.find_by(id: params[:id])
    if share.destroy
      render json: "Contact unshared!"
    else
      render json: "You weren't friends to begin with!"
    end
  end

  private
  def contact_share_params
    params[:contact_share].permit(:user_id, :contact_id)
  end
end
