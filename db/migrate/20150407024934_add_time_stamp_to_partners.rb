class AddTimeStampToPartners < ActiveRecord::Migration
  def change
  	add_timestamps :partners
  end
end
