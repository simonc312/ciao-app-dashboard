class CreateCiaoAppUser < ActiveRecord::Migration
  def change
  	create_table :ciaoappusers do |t|
    	t.integer :country_code
    	t.integer :state_id
    	t.integer :gender
    	t.integer :is_active
    	t.datetime :modified_at
    	t.datetime :signed_up_at
    	t.timestamps
    end
  end
end
