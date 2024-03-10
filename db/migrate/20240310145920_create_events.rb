class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.text :title
      t.text :description
      t.date :date
      t.text :location

      t.timestamps
    end
  end
end
