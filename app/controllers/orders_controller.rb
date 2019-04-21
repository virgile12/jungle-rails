class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @line_items = LineItem.where order_id: @order.id
    @items = []
    @line_items.each do |line_item|
      product = Product.find(line_item.product_id)
      @items.push(product)
    end
    @receipt = Receipt.find_by(order_id: @order.id)
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      @receipt = Receipt.new(
        order_id: order.id,
        user_id: session[:user_id]  
      )
      @receipt.save
      redirect_to order, notice: 'Order Sucessfully Submitted'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end 
  
  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # No product in cart --
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Ecommerce Transaction",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

  def send_email(order)
    @order = order
    Mailer.order_receipt(@order).deliver_later
  end


end
