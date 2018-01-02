class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params['q']},25))?format=json&show=storeId,storeType,name&pageSize=10&apiKey=#{ENV['API_KEY']}")
    stores_data = JSON.parse(response.body)
require 'pry'; binding.pry
  end

end