class AddGroupToProceedings < ActiveRecord::Migration[7.0]
  def change
    add_reference :proceedings, :group, null: false, foreign_key: true
  end
end
