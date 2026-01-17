class AddColumnParcelasToDebfixos < ActiveRecord::Migration[8.1]
  def change
    add_column :debfixos, :parcela, :integer, default: nil
  end
end
