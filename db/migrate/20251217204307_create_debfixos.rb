class CreateDebfixos < ActiveRecord::Migration[8.1]
  def change
    create_table :debfixos do |t|
      t.string :nome_debfx, null: false
      t.decimal :valor_debfx, null: false
      t.string :cmpt_ini, null: false
      t.string :cmpt_fim, null: false
      t.boolean :quitado, default: false
      t.references :userconf, foreign_key: true, null: false
      t.references :contrato, foreign_key: true, null: false
      t.timestamps
    end
  end
end
