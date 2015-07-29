class CreateJoinTableLatterRecipient < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.references :latter
      t.references :user
      t.boolean    :is_read, default: false
      t.boolean    :is_spam, default: false

      t.index [:latter_id, :user_id]
      t.index [:user_id, :latter_id]
    end
  end
end
