class AddResponseBodyToApiRequest < ActiveRecord::Migration
  def change
  	add_column :api_requests, :response_body, :text
  end
end
