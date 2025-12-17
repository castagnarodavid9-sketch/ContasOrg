class AddColumnsdeHoraExtraToContratos < ActiveRecord::Migration[8.1]
  def change
    add_column :contratos, :horas_mensais, :decimal, precision: 10, scale: 2, null: false
    add_column :contratos, :vlr_hr_normal, :decimal, precision: 10, scale: 2, null: false
    add_column :contratos, :vlr_hr_extra, :decimal, precision: 10, scale: 2, null: false
  end
end
