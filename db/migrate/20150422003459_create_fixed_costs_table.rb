class CreateFixedCostsTable < ActiveRecord::Migration
  def change
    create_table :fixed_costs do |t|
    	t.integer :salaries
    	t.integer :server_hosting
    	t.integer :rent
    	t.integer :misc
    	t.belongs_to :admin, index: true
    	t.timestamps
    end
  end
end
