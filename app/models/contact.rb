class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id }

  belongs_to :owner,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'User'

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments,
    as: :commentable

  has_many :group_memberships
  has_many :groups, through: :group_memberships

end
