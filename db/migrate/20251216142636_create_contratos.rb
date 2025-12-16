class CreateContratos < ActiveRecord::Migration[8.1]
  def change
    create_table :contratos do |t|
      t.string :nome_empresa, null: false
      t.decimal :salario_bruto, null: false
      t.decimal :salario_liquido, null: false
      t.integer :horas_semanais, null: false
      t.references :userconf, foreign_key: true, null: false
      t.timestamps
    end
  end
end
