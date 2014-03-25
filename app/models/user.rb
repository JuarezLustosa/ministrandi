class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
                  :remember_me, :name, :admin, :vendor, :percent
  # attr_accessible :title, :body
  
  scope :vendor, -> { where(vendor: true) } 
  scope :search_by_name, lambda { |term| order(:name).where("name like ?", "#{term}%") }
end
