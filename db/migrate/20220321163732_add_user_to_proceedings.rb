class AddUserToProceedings < ActiveRecord::Migration[7.0]
  def change
    add_reference :proceedings, :user, null: false, foreign_key: true
  end
end
