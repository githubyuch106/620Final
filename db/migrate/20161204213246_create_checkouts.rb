class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts do |t|

      t.date :checkout_date
      t.date :due_date
      t.belongs_to :member
      t.string :book_name

      t.timestamps
    end
  end
end
