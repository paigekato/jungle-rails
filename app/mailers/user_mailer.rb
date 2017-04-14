class UserMailer < ApplicationMailer

  default from: "paigekato@hotmail.com"

  def confirmation_email(user, order)
    email = user.email
    @order = order
    @name = user.name
    mail(to: email, subject: 'Order Confirmation')
  end

end
