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
    @drink.save

    # Send Email to innovator
    EmailLib.send_apply_email @drink

    redirect_to drinks_url
  end

  def index
    @drinks = Drink.all.select {|d| d.builder_email == nil}
  end

  def create
    @drink = Drink.new(params.require(:drink).permit(:title, :stevia, :bottle_type, :alcohol_type, :energy_type, :img_ref, :blubber, :required_amount, :price_idea, :innovator_email))
    @drink.save
    redirect_to @drink
  end

end
