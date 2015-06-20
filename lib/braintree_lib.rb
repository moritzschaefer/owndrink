
class BraintreeLib
  def self.create_customer first_name, last_name, payment_nonce
    print payment_nonce
    result = Braintree::Customer.create first_name: first_name, last_name: last_name, payment_method_nonce: payment_nonce
    if result.success?
      return result.customer.id
    else
      return nil
    end
  end

  def self.transfer_money drink
    customer = Braintree::Customer.find(drink.innovator_braintree_id)
    payment_method_token = customer.payment_methods[0].token

    result = Braintree::Transaction.sale(
      :merchant_account_id => drink.builder_braintree_id,
      :amount => (drink.required_amount*drink.price_idea).to_s,
      :payment_method_token => payment_method_token,
      :service_fee_amount => "0.00"
    )
    if not result.success?
      result.errors.each do |error|
        Rails.logger.fatal error.message
      end
    end

    result.success?
  end

  def self.create_merchant first_name, last_name, email
    result = Braintree::MerchantAccount.create(
      individual: {
        :first_name => first_name,
        :last_name => last_name,
        :email => "jane@14ladders.com",
        :phone => "5553334444",
        :date_of_birth => "1981-11-19",
        :ssn => "456-45-4567",
        :address => {
          :street_address => "111 Main St",
          :locality => "Chicago",
          :region => "IL",
          :postal_code => "60622"
        }
      },
      :funding => {
        :descriptor => "Blue Ladders",
        :destination => Braintree::MerchantAccount::FundingDestination::Bank,
        #  :email => "funding@blueladders.com",
        :email => email,
        :mobile_phone => "5555555555",
        :account_number => "1123581321",
        :routing_number => "071101307"
      },
      :tos_accepted => true,
      :master_merchant_account_id => "zqzd2s56fcmvzjpr")
    if result.success?
      return result.merchant_account.id
    else
      result.errors.each do |error|
        Rails.logger.fatal error.message
      end
      nil
    end
  end
end
