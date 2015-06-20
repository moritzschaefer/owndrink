class AddBraintreeIdsToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :innovator_braintree_id, :string
    add_column :drinks, :builder_braintree_id, :string
  end
end
