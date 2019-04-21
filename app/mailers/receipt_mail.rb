class UserMailer < ApplicationMailer

    def order_email(user, order)
  
      @user = user
      @order  = order
      mail(to: @order.email, subject: "Thank you for your purchase. Id : #{@order.id}")
    end
  
  end