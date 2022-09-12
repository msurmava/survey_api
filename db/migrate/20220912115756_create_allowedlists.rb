class CreateAllowedlists < ActiveRecord::Migration[7.0]
  def change
    create_table :allowedlists do |t|
      t.string :token

      t.timestamps
    end
  end
end
