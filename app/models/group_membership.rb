class GroupMembership < ActiveRecord::Base
  validates :contact_id, :group_id, presence: true
  belongs_to :group
  belongs_to :contact
end
