class Recipient < ActiveRecord::Base
  belongs_to :latter
  belongs_to :user
end
