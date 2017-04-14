class UserMailer < ApplicationMailer

  default from: "paigekato@hotmail.com"

  def confirmation_email(order, user)
    @order = order
    @user = user.name
    mail(to: @order.email, subject: 'Order Confirmation')
  end

end
