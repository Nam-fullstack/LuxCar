class UserMailer < ApplicationMailer
    default from: 'notifications@luxcar-nam.herokuapp.com'

    def welcome_email
        @user = params[:user]
        @url = 'https://luxcar-nam.herokuapp.com/'
        mail(to: @user.email, subject: "Welcome to LuxCar! Find your dream now.")
    end

    def purchase_confirmation_email
        @user = parmas[:user]
        @purchase = params[:purchase]
        mail(to: @user.email, subject: "Congratulations on your car purchase!")
    end
end
