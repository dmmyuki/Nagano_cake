class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null:false
      t.string :destination_postal_code, null:false
      t.string :destination_address, null:false
      t.string :destination_name, null:false
      t.integer :postage, null:false
      t.integer :charge, null:false
      t.integer :payment_method, null:false, default:0
      t.integer :status, null:false, default:0

      t.timestamps
    end
  end
end
