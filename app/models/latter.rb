class Latter < ActiveRecord::Base
  belongs_to :user
  has_many   :attachments, dependent: :destroy
  has_many   :recipients,  dependent: :destroy
  has_many   :users, through: :recipients

  scope :inbox, ->(user) { joins(:recipients).where(recipients: { user: user }) }
  scope :spam,  ->(user) { joins(:recipients).where(recipients: { user: user, is_spam: true }) }

  validates :recipients, :presence => true
end
