class AddColumnPagoToDebitos < ActiveRecord::Migration[8.1]
  def change
    add_column :debitos, :pago, :boolean, default: false
  end
end
