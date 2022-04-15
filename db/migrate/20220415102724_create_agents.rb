class CreateAgents < ActiveRecord::Migration[6.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :image
      t.string :role
      t.text :description
      t.string :skill1_name
      t.text :skill1_detail
      t.string :skill2_name
      t.text :skill2_detail
      t.string :skill3_name
      t.text :skill3_detail
      t.string :skill4_name
      t.text :skill4_detail
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
