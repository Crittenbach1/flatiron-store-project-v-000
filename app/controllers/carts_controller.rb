class CartsController < ApplicationController
   def show
     @user = current_user
   end

   def checkout
    # binding.pry
     current_user.current_cart.items.each do |i|
       @quantity = LineItem.find_by(cart_id: current_user.current_cart.id, item_id: i.id).quantity
       i.inventory -= @quantity
       i.save
     end
     @id = current_user.current_cart.id
     current_user.current_cart.destroy

     redirect_to cart_path(@id)
   end
end
