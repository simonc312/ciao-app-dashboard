class CiaoAppUser < ActiveRecord::Base
  belongs_to :partner, inverse_of: :ciaoappuser, counter_cache: :count_of_ciaoappusers

end
