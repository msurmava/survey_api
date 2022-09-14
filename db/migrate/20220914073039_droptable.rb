class Droptable < ActiveRecord::Migration[7.0]
  def change
    drop_table :company_emploees
  end
end
