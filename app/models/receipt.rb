class Receipt < ActiveRecord::Base
  belongs_to :user
  # validates :stripe_id, uniqueness: true

  # def receipt
  #   Receipts::Receipt.new(
  #     id: id,
  #     subheading: "RECEIPT FOR CHARGE #%{id}",
  #     product: "GoRails",
  #     company: {
  #       name: "One Month, Inc.",
  #       address: "Lighthouse Labs IceCream E-Shop",
  #       email: "no-reply@jungle.com",
  #       logo: Rails.root.join("app/assets/images/one-month-dark.png")
  #     },
  #     line_items: [
  #       ["Date",           created_at.to_s],
  #       ["Account Billed", "#{user.name} (#{user.email})"],
  #       ["Product",        "GoRails"],
  #       ["Amount",         "$#{amount / 100}.00"],
  #       ["Charged to",     "#{card_type} (**** **** **** #{card_last4})"],
  #       ["Transaction ID", uuid]
  #     ],
  #     font: {
  #       bold: Rails.root.join('app/assets/fonts/tradegothic/TradeGothic-Bold.ttf'),
  #       normal: Rails.root.join('app/assets/fonts/tradegothic/TradeGothic.ttf'),
  #     }
  #   )
  # end
end