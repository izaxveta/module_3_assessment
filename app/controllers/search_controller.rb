class SearchController < ApplicationController
  def index
    stores_data = store_presenter.present_store_search(params['q'])
    @stores = stores_data.first
    @total = stores_data.last
  end

  private
    attr_reader :store_presenter

    def store_presenter
      @store_presenter ||= StorePresenter.new
    end
end
