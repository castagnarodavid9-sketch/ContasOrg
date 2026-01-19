class AddNroParcelaToDebitos < ActiveRecord::Migration[8.1]
  def change
    add_column :debitos, :nro_parcela, :int, default: nil
  end
end
