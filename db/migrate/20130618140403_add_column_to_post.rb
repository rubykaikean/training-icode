class AddColumnToPost < ActiveRecord::Migration
  def change

  	add_column :posts, :body , :string

  	add_column :posts, :contact , :string
  	

  end
end
