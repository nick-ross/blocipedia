class WelcomeController < ApplicationController

  skip_before_filter :authenticate_user!

  def index
    render
  end

  def about
  end
end
