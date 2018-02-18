class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.order_confirmation.subject
  #
  def order_confirmation(order)
    @order = order
    mail to: "#{order.user.email}",subject: "Your order has been confirmed -#{order.order_number}"
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.welcome_message.subject
  #
  def welcome_message(user)
    binding.pry
    @greeting = "Hi Welcolme u are signed in"
    mail to: "#{user.email}"
  end
end
