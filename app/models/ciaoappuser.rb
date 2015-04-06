class CiaoAppUser < ActiveRecord::Base
  belongs_to :partner, inverse_of: :ciaoappuser, cache_counter: :count_of_ciaoappusers

end
