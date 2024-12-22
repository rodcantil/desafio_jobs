class CreatePostulations < ActiveRecord::Migration[8.0]
  def change
    create_table :postulations do |t|
      t.string :status
      t.references :offer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
