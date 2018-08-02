class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :sender_number
      t.string :receiver_number
      t.integer :credit_amount
      t.integer :debit_amount
      t.string :sender_network
      t.string :receiver_network
      t.integer :receiver_balance
      t.datetime :time
      t.string :status
      t.string :reason
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
