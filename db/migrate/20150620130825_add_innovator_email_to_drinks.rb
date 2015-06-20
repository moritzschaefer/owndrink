class AddInnovatorEmailToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :innovator_email, :string
  end
end
