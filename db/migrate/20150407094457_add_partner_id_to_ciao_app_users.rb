class AddPartnerIdToCiaoAppUsers < ActiveRecord::Migration
  def change
  	add_column :ciaoappusers, :partner_id, :integer
  end
end
