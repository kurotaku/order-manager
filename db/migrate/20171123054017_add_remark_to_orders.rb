class AddRemarkToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :remark, :string
  end
end
