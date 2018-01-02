class SearchController < ApplicationController
  def index
    conn = Faraday.get('')
    params['q']
  end

end