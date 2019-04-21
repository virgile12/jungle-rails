class ReceiptsController < ApplicationController
    # before_action :authenticate_with_http_digest
    before_action :set_receipt only: [:show]

    def index
      @receipts = Receipt.all
    end

    def new
      @receipt = Receipt.new
    end
       

    def show
      respond_to do |format|
        format.pdf {
          send_data @receipt.receipt.render,
          filename: "#{@receipt.created_at.strftime("%Y-%m-%d")}-ecommerce-receipt.pdf",
          type: "application/pdf",
          disposition: :attachment
        }
      end
    end

    def create
      @receipt = Receipt.create(
        order_id: params[:order.id],
        user_id: session[:user_id]  
      )
      @receipt.save
    end
    #     Receipts::Receipt.new(
    #       id: id,
    #       subheading: "RECEIPT FOR CHARGE #%{id}",
    #       product: "GoRails",
    #       company: {
    #         name: "One Month, Inc.",
    #         address: "Lighthouse Labs IceCream E-Shop",
    #         email: "no-reply@jungle.com",
    #         logo: Rails.root.join("app/assets/images/one-month-dark.png")
    #       },
    #       line_items: [
    #         ["Date",           created_at.to_s],
    #         ["Account Billed", "#{user.name} (#{user.email})"],
    #         ["Product",        "GoRails"],
    #         ["Amount",         "$#{amount / 100}.00"],
    #         ["Charged to",     "#{card_type} (**** **** **** #{card_last4})"]
    #       ]
    #     )
    #     end
    # end
  
    private
  
      def set_receipt
        @receipt = current_user.receipts.find(params[:id])
      end
end