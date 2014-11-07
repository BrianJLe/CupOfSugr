class ReservationMailer < ActionMailer::Base
  default from: "brian.joe.le@gmail.com"

  def confirm_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'New notification for reservation')
  end
end
