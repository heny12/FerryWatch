class WelcomeController < ApplicationController
  def index
    @terminals = Terminal.all
  end

  def create
  end
end
