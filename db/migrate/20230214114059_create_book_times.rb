class CreateBookTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :book_times do |t|
      t.integer   :day
      t.integer   :hour
      t.integer   :minute
      t.integer   :second
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
