class User < ActiveRecord::Base
  belongs_to :roleable, polymorphic: true
  enum role: [:partner, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :partner
  end

  def confirmation_required?
    if self.role == :admin
      false
    else 
      true
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
