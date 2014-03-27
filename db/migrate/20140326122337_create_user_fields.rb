class CreateUserFields < ActiveRecord::Migration
  def change
    create_table :user_fields do |t|

      t.string  :employment
      t.integer :salary
      t.integer :experience
      t.text    :learning_place

      t.integer :user_id
    end

    add_index :user_fields, :user_id
  end
end
