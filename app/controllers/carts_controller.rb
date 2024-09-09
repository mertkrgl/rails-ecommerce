class CartsController < ApplicationController

  def show
    @cart = session[:cart] || {}
    @cart.reject! { |product_id, _quantity| Product.find_by(id: product_id).nil? }
  end
  def add
  
  if session[:cart].nil?
    session[:cart] = {}
  end
    
  product_id = params[:product_id]
  quantity = params[:quantity].to_i

  if session[:cart].include?(product_id)
    session[:cart][product_id] += quantity
  else
    session[:cart][product_id] = quantity
  end
    
  end
  
def destroy

  product_id = params[:product_id]

  session[:cart].delete(product_id)

  redirect_to cart_path
end



end
