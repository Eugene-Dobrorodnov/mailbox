class Latter < ActiveRecord::Base
  belongs_to :user
  has_many   :attachments, dependent: :destroy
  has_many   :recipients,  dependent: :destroy
  has_many   :users, through: :recipients

  validates :recipients, :presence => true
end
