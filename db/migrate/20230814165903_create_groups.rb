class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.datetime :start_date_of_week, null: false, default: Time.now

      t.timestamps
    end
  end
end
