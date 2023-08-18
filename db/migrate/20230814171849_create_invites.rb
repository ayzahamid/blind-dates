class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.datetime :start_date_of_week, null: false
      t.references :employee, null: false
      t.string :status, null: false, default: 'pending'

      t.timestamps
    end
  end
end
