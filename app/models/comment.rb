class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :author_id, :comment, presence: true
end
