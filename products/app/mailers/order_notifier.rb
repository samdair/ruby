class OrderNotifier < ActionMailer::Base
  default from: "samtklbd@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  
  
    
  def received(order)
    @order = order
    mail(:to => order.email, 
    :subject =>'Habesha Store Order Confirmation',
    :sent_on => Time.now)
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail(:to => order.email, 
    :subject =>'Habesha Store Shipped Confirmation',
    :sent_on => Time.now)
  end
end
