class UserMailer < ActionMailer::Base
  default from: "samtklbd@gmail.com"
  
   def registration_confirmation(user)
     @user=user
   mail(:to => user.email, 
    :subject =>"Thank you for registering",
    :sent_on => Time.now)
    
  end
end
