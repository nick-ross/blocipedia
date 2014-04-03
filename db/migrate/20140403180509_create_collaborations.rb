class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.belongs_to :user, null: false
      t.belongs_to :wiki, null: false

      t.timestamps
    end
    add_index :collaborations, :user_id
    add_index :collaborations, :wiki_id
  end
end
