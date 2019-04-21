class Mailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @order = order
    @items = []
    line_items = LineItem.where order_id: @order.id
    line_items.each do |line_item|
      product = Product.find(line_item.product_id)
      @items.push(product)
    end
    email_subject = 'Your order #' + order.id.to_s + ' receipt from Ecommerce'
    mail to: '<email_address>', subject: email_subject
  end

end