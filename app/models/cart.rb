class Cart < ActiveRecord::Base
   has_many :line_items
   has_many :items, through: :line_items
   belongs_to :user

   def total
     #binding.pry

     total = 0
     self.items.each do |i|
       if self.user != nil
          @user = User.find(self.user_id)
          @quantity = LineItem.find_by(cart_id: @user.current_cart.id, item_id: i.id).quantity
       end
       if @quantity
          @price = i.price * @quantity
       else
          @price = i.price
       end
       total += @price
      end
     total
   end

   def add_item(item_id)
    @item = LineItem.find_by(item_id: item_id)
      if @item
        @item
      else
        @item = LineItem.new(cart_id: self.id, item_id: item_id)
      end
      @item
   end
end
