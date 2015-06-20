class AddBuilderEmailToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :builder_email, :string
  end
end
