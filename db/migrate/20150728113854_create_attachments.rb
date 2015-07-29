class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :latter
      t.string     :attachment, null: false

      t.timestamps null: false
    end
  end
end
