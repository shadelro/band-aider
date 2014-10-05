class UpdateMembershipsAddInstrumentAndBio < ActiveRecord::Migration
  def change
    add_column :memberships, :instrument, :string
    add_column :memberships, :bio, :text
  end
end
