class OrderMailer < ApplicationMailer
  default from: 'shopstickydevs@gmail.com'

  def order_summary_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Order summary')
  end
end
