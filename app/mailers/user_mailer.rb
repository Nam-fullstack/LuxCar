class UserMailer < ApplicationMailer
    default from: 'notifications@luxurycar.herokuapp.com'

    def welcome_email
        @user = params[:user]
        @url = 'https://luxurycar.herokuapp.com/'
        mail(to: @user.email, subject: "Welcome to LuxuryCar! Find your dream now.")
    end

end
