class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.references :user, foreign_key: true
      # t.references :section, foreign_key: true
      t.string :author
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
