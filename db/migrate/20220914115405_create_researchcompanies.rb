class CreateResearchcompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :researchcompanies do |t|
      t.references :research, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
