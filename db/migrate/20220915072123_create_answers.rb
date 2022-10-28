class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :option, foreign_key: true
      t.string :text
      t.references :user, default: nil 

      t.timestamps
    end
  end
end
