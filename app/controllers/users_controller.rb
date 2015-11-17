class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy
      render json: user
    else
      render json: "Cannot destroy"
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def favorite
    contacts = User.find_by(id: params[:user_id]).contacts.where(favorite: true)
    shared_contacts = User.find_by(id: params[:user_id]).shared_contacts.where(favorite: true)
    render json: (contacts + shared_contacts).uniq
  end

  private
  def user_params
    params[:user].permit(:username)
  end
end
