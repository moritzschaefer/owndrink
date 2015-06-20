class DrinksController < ApplicationController
  def new
  end

  def show
    @drink = Drink.find(params[:id])

  end

  def index
    @drinks = Drink.all
  end

  def create
    @drink = Drink.new(params.require(:drink).permit(:title, :stevia, :bottle_type, :alcohol_type, :energy_type, :img_ref, :blubber, :required_amount, :price_idea, :innovator_email))
    @drink.save
    redirect_to @drink
  end
end
