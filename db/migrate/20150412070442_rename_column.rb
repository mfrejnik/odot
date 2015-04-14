class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :users, :password_difest, :password_digest
  end
end
