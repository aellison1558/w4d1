class ContactsController < ApplicationController
  def index
    our_contacts = User.find_by(id: params[:user_id]).contacts
    shared_with_us_contacts = User.find_by(id: params[:user_id]).shared_contacts
    render json: (our_contacts + shared_with_us_contacts).uniq
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.ful_messages, status: :unprocessable_entity
    end
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.ful_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    if contact.destroy
      render json: contact
    else
      render json: "Cannot destroy what does not exist"
    end
  end

  private
  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end
end
