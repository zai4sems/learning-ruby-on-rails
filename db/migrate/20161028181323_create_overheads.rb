class CreateOverheads < ActiveRecord::Migration
  def change
    create_table :overheads do |t|
      t.string :title
      t.decimal :month_1
      t.decimal :month_2
      t.decimal :month_3
      t.decimal :month_4
      t.decimal :month_5
      t.decimal :month_6
      t.decimal :month_7
      t.decimal :month_8
      t.decimal :month_9
      t.decimal :month_10
      t.decimal :month_11
      t.decimal :month_12
      t.decimal :total
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
