class PagesController < ApplicationController
  def index
    @dogs_api_key = ENV['DOGS_API_KEY']
  end
end
