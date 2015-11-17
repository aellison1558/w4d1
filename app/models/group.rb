class Group < ActiveRecord::Base
  validates :name, :user_id, presence: true
  belongs_to :user
  has_many :group_memberships
  has_many :contacts, through: :group_memberships
end
