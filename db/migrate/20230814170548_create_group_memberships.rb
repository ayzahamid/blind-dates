class CreateGroupMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :group_memberships do |t|
      t.boolean :leader, default: false

      t.references :group, null: false, default: ""
      t.references :employee, null: false, default: ""

      t.timestamps
    end
  end
end
