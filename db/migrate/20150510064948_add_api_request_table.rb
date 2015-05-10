class AddApiRequestTable < ActiveRecord::Migration
  def change
  	create_table :api_requests do | api|
  		api.timestamps null: false
  		api.text :url, null: false
  	end

  	add_index :api_requests, :url, unique: true
  end
end
