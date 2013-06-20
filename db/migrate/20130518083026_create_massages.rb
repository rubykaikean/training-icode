class CreateMassages < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
