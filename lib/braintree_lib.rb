
class BraintreeLib
  def self.create_customer first_name, last_name, payment_nonce
    result = Braintree::Customer.create first_name: first_name, last_name: last_name, payment_method_nonce: payment_nonce
    if result.success?
      return result.customer.id
    else
      return nil
    end
  end

  def self.transfer_money drink
    customer = Braintree::Customer.find(drink.innovater_braintree_id)
    payment_method_token = customer.payment_methods[0].token

    result = Braintree::Transaction.sale(
      :merchant_account_id => drink.builder_braintree_id,
      :amount => (drink.required_amount*drink.price_idea).to_s,
      :token  => payment_method_token,
      :service_fee_amount => "0.00"
    )

    result.success?
  end

  def self.create_merchant first_name, last_name, email
    result = Braintree::MerchantAccount.create(
      individual: {
        first_name: uiae,
        last_name: uiae
      },
      funding: {
        :email => email,
      },
      :tos_accepted => true,
      :master_merchant_account_id => "zqzd2s56fcmvzjpr")
    if result.success?
      return result.merchant_account.id
    end
  end
end
