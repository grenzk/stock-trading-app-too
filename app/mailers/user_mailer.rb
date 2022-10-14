class UserMailer < ApplicationMailer
  default from: 'sphynx46@gmail.com'

  def account_approved_email
    @user = params[:user]

    mail to: @user.email, subject: 'Welcome, Trader!'
  end
end
