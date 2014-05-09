class User < ActiveRecord::Base
  validates :username, presence: {message: "cannot be blank"}
  validates :password, presence: true, length:  { minimum: 2 }

end