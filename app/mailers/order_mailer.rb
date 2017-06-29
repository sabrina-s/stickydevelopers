class OrderMailer < ApplicationMailer
  default from: 'shopstickydevs@gmail.com'

  def order_summary_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Your order summary')
  end

  def order_shipped_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Your order is on the way!')
  end
end
