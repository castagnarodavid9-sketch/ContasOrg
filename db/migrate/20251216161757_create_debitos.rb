class CreateDebitos < ActiveRecord::Migration[8.1]
  def change
    create_table :debitos do |t|
      t.string :nome_debito, null: false
      t.decimal :valor_debito, null: false
      t.text :descricao
      t.boolean :fixo, default: false
      t.timestamp :data_vencimento
      t.references :contrato, foreign_key: true, null: false
      t.references :userconf, foreign_key: true, null: false
      t.timestamps
    end
  end
end
