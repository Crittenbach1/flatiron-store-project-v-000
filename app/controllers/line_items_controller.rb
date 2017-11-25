class LineItemsController < ApplicationController
  def create
    if current_user.current_cart == nil
      current_user.current_cart = current_user.carts.create
    end
      @line_item = LineItem.find_by(cart_id: current_user.current_cart.id, item_id: params[:item_id])
      if @line_item
        @line_item.quantity += 1
        @line_item.save
      else
        LineItem.create(cart_id: current_user.current_cart.id, item_id: params[:item_id])
      end
    redirect_to cart_path(current_user.current_cart)
    #binding.pry
  end
end
