class CreateUserconfs < ActiveRecord::Migration[8.1]
  def change
    create_table :userconfs do |t|
      t.string :nome, null: false
      t.string :telefone
      t.string :email, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
