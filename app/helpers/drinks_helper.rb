# As a hash
module DrinksHelper
  def apply_path drink
    'drinks/' + drink.id.to_s + '/apply'
  end

end
