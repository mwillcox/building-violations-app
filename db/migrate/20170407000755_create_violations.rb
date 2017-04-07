class CreateViolations < ActiveRecord::Migration[5.0]
  def change
    create_table :violations do |t|
      t.string :category
      t.timestamp :date
      t.timestamp :date_closed
      t.string :type

      t.timestamps
    end
  end
end
