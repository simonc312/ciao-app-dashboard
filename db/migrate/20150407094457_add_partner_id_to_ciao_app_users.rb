class AddPartnerIdToCiaoAppUsers < ActiveRecord::Migration
  def change
  	add_reference :ciaoappusers, :partner, index: true
  end
end
