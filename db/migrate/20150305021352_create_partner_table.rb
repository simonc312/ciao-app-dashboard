class CreatePartnerTable < ActiveRecord::Migration
  def change
    create_table :partners do |t|
    	t.integer :employee_size
    	t.integer :revenue_size
    	t.string :address
    	t.integer :city
    	t.integer :country
    	t.integer :zipcode
    	t.integer :channel_type_id
    	t.integer :retail_chain_id
    end
  end
end
