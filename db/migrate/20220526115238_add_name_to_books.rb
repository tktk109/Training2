class AddNameToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :name, :string
  end
end
