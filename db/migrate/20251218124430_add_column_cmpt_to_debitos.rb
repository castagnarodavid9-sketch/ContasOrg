class AddColumnCmptToDebitos < ActiveRecord::Migration[8.1]
  def change
    add_column :debitos, :cmpt, :string, default: nil
  end
end
