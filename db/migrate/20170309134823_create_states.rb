class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :code
      t.string :name
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
