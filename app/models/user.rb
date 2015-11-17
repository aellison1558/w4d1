class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :contact_shares

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :contacts

  has_many :comments,
    as: :commentable

  has_many :authored_comments,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: 'Comment'

  has_many :groups

end
