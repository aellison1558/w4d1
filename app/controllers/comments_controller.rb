class CommentsController < ApplicationController
  def index
    if params[:user_id]
      comments = User.find_by(id: params[:user_id]).comments
    else
      comments = Contact.find_by(id: params[:contact_id]).comments
    end
    render json: comments
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.destroy
      render json: comment
    else
      render json: "They hate you cause they ain't you :)"
    end
  end

  private
  def comment_params
    params[:comment].permit(:comment, :commentable_id, :commentable_type, :author_id)
  end
end
