class CreateMessages < ActiveRecord::Migration[4.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :user_id
      t.integer :friend_id
    end
  end
end
