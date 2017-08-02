class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :author
      t.string :body
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end

    add_index :comments, [:movie_id, :user_id], :unique => true
  end
end
