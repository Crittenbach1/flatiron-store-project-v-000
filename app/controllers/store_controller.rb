class StoreController < ApplicationController
   def index
     @categories = Category.all
     @items = Item.available_items
     @user = current_user
     #binding.pry
     if @user && @user.current_cart != nil
       @current_cart = @user.current_cart
     else
       @current_cart = false
     end

   end

end
