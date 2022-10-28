class CreateInquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.references :research, null: false, foreign_key: true

      t.timestamps
    end
  end
end
