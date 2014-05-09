class User < ActiveRecord::Base
  validates :username, presence: {message: "cannot be blank"}
  validates :password, presence: true, length:  { minimum: 4 }

  def password
    @password
  end

  def password=(password)
    @password = password
    self.hashed_password = BCrypt::Password.create(password)
  end

end