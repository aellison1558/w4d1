class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :contact_shares

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :contacts

end
