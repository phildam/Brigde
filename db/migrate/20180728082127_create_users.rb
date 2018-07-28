class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :sender_number
      t.string :pass_code
      t.datetime :time
      t.string :service_provider

      t.timestamps
    end
  end
end
