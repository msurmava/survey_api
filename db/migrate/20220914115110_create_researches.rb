class CreateResearches < ActiveRecord::Migration[7.0]
  def change
    create_table :researches do |t|
      t.string :name

      t.timestamps
    end
  end
end
