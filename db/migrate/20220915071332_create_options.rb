class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.references :question, null: false, foreign_key: true
      t.boolean :correct, default: false
      t.string :body

      t.timestamps
    end
  end
end
