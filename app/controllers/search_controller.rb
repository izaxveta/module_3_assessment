class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params['q'].to_i},25))?format=json&show=storeId,storeType,longName,phone,city,distance&pageSize=10&apiKey=#{ENV['API_KEY']}")
    stores_data = JSON.parse(response.body)
    @stores = stores_data['stores'].map do |data|
      Store.new(data)
    end
    @total = stores_data['total']
  end
end