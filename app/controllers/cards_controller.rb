class CardsController < ApplicationController
  protect_from_forgery :except => [:create]

  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    customer = Payjp::Customer.create(
      card: params[:pay_id]
    )

    card = Card.new(
      customer_id: customer.id,
      user_id: current_user.id
    )
    card.save

    redirect_to new_card_path(current_user)
  end
end
