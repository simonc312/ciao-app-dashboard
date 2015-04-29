class AddDateOfBirthToCiaoappusers < ActiveRecord::Migration
  def change
  	add_column :ciaoappusers, :date_of_birth, :datetime
  end
end
