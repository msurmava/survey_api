class CreateResponders < ActiveRecord::Migration[7.0]
  def change
    create_table :responders do |t|
      t.string :code

      t.timestamps
    end
  end
end
