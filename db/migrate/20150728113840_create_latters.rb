class CreateLatters < ActiveRecord::Migration
  def change
    create_table :latters do |t|
      t.references :user
      t.string     :subject
      t.text       :content

      t.timestamps null: false
    end
  end
end
