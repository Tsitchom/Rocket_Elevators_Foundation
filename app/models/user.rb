class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable
  def name
    id 
  end 
end
