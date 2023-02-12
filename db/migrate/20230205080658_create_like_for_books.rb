class CreateLikeForBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :like_for_books do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :evaluation
      t.text :review
      t.timestamps
    end
  end
end
