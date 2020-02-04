class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cpf, :string, limit: 11
    add_column :users, :birth_date, :date
    add_column :users, :gender, :char
  end
end
