class DrinksController < ApplicationController
  def new

  end

  def show
    @drink = Drink.find(params[:id])

  end

  def show_apply
    @drink = Drink.find(params[:id])
  end


  def apply
    @drink = Drink.find(params[:id])
    @drink.builder_email = params.require(:drink).permit(:builder_email)[:builder_email]
    last_name = params['last_name']
    first_name = params['first_name']
    merchant_id = BraintreeLib.create_merchant first_name, last_name, @drink.builder_email

    if not merchant_id
      head :bad_request
    else
      @drink.builder_braintree_id = merchant_id

      @drink.save

      # Send Email to innovator
      EmailLib.send_apply_email @drink

      redirect_to drinks_url
    end
  end

  def index
    @drinks = Drink.all.select {|d| d.builder_email == nil}
  end

  def create
    @drink = Drink.new(params.require(:drink).permit(:title, :stevia, :bottle_type, :alcohol_type, :energy_type, :img_ref, :blubber, :required_amount, :price_idea, :innovator_email))
    braintree_id = BraintreeLib.create_customer params['first_name'],params['last_name'], params[:payment_method_nonce]
    if not braintree_id
      head :bad_request # TODO improve
    else
      @drink.innovator_braintree_id = braintree_id
      @drink.save
      redirect_to @drink
    end
  end

end
