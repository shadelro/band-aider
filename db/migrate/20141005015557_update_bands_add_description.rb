class UpdateBandsAddDescription < ActiveRecord::Migration
  def change
    add_column :bands, :description, :text
  end
end
