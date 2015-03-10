class CiaoAppUser < ActiveRecord::Base
  belongs_to :partner, inverse_of: :ciaoappuser, cache_counter: :count_of_ciaoappusers
  enum role: [:user]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

end
