class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :inquiry, null: false, foreign_key: true
      t.string :body,  null: false
      t.boolean :optional, default: false 

      t.timestamps
    end
  end
end
