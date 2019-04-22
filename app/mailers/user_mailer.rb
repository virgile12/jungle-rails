class UserMailer < ApplicationMailer

    def order_email(user, order, total_amount)
      
      @user = user
      @order  = order
      @total_amount = total_amount
      mail(to: @order.email, subject: "Ecommerce purchase! Id : #{@order.id}")
    end
  
  end


