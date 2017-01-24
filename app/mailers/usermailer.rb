class Usermailer < ActionMailer::Base
  default from: "sitemail@gmail.com"

  def ordercreated_email(order)
    @order = order
    @url = orders_url
    mail(to: order.customer.user.owner.email, subject: "New Order created for You")
  end

  def orderforagent_email(order)
    @order = order
    @url = orders_url
    mail(to: order.customer.user.email, subject: "New Order Available for You")
  end

  def orderdelivered_email(order)
    @order = order
    @url = orders_url
    mail(to: order.customer.user.owner.email, cc: 'admin@gmail.com', subject: "Order Delivered to Customer")
  end

  def ordercomplete_email(order)
    @order = order
    @url = orders_url
    mail(to: order.customer.user.email, cc: order.customer.user.owner.email, subject: "Order Complete")
  end

  def ordercancelled_email(order)
    @order = order
    @url = orders_url
    mail(to: 'admin@gmail.com', subject: "Order Cancelled")
  end
  

  def password_reset_email(user, user_url)
    @user = user
    @url = user_url
    mail(to: @user.email, subject: "Replacement login for #{@user.email} at Fivestarstoves")
  
  end
end
