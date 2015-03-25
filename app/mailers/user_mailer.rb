class UserMailer < ApplicationMailer
  default from: "test_email@example.com"

  def sign_up_confirm(user)
    @user = user
    mail to: user.email, subject: "Thanks for signing up!"
  end
end
