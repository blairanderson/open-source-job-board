class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts

  def is_admin?
    id == 1 || email.in?(ENV.fetch("ADMIN_EMAIL").split(","))
  end
end
