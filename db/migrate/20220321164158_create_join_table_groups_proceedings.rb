class CreateJoinTableGroupsProceedings < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :proceedings do |t|
      t.index [:group_id, :proceeding_id]
      t.timestamps
    end
  end
end
