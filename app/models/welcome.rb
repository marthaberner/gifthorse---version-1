class Welcome < ActiveRecord::Base
  validates :username, presence: true

end