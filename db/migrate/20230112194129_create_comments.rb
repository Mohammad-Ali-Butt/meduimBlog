class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :commenter, index: true, foreign_key: { to_table: :users }
      t.text :body
      
      t.integer :commentable_id;
      t.string :commentable_type

      #t.references :commentable, polymorphic: true
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
