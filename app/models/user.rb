class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes




  
  rolify
  # Callbacks
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  def admin?
    has_role? :admin
  end 
end
