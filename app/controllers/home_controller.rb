class HomeController < ApplicationController
    def index
        render plain: 'hi'
    end
end
