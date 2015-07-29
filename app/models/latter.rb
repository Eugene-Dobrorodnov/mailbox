class Latter < ActiveRecord::Base
  belongs_to :user
  has_many   :attachments, dependent: :destroy
  has_many   :recipients,  dependent: :destroy
  has_many   :users, through: :recipients

  scope :inbox, ->(user) { joins(:recipients).where(recipients: { user: user }) }

  validates :recipients, :presence => true
end
