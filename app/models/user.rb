class User < ApplicationRecord

  has_secure_password

  validates :password, presence: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
