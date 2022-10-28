class CreateAnswerresponders < ActiveRecord::Migration[7.0]
  def change
    create_table :answerresponders do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :responder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
