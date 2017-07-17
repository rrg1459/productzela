class CreateVigentes < ActiveRecord::Migration[5.0]
  def change
    create_table :vigentes do |t|
      t.integer :dias

      t.timestamps
    end
  end
end
