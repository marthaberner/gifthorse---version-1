class Welcome < Application::Base
  validates :username, presence: true

end