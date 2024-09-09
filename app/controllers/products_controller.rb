class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]
before_action :authorize_admin, only: [:edit,:update,:new,:create,:destroy]

def index
  @products = Product.all
end

def show
end

def new
  @product = Product.new
end

def create
@product = Product.new(product_params)
if @product.save
  redirect_to home_path , notice: "Ürün başarıyla eklendi."
else
  render :new
end
end


def edit
end

def update
  if @product.update(product_params)
    redirect_to product_path , notice: "Ürün başarıyla güncellendi."
  else
    render :edit
  end

end

def destroy
  
  if session[:cart] && session[:cart][@product.id]
    session[:cart].delete(@product.id)
  end

  @product.destroy
  redirect_to products_path, notice: "Ürün başarıyla silindi."
end


private

def set_product
  @product = Product.find(params[:id])
end


def product_params
  params.require(:product).permit(:name, :description, :price)
end

def authorize_admin
  unless current_user && current_user.role == 'admin'
    redirect_to home_path , alert: "Yetkiniz yok."
  end

end

  
end
