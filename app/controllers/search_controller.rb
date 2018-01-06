class SearchController < ApplicationController
  def index
    @stores = presenter(params['q']).stores
    @total = presenter(params['q']).total
  end

  private
    attr_reader :presenter

    def presenter(filter)
      @presenter ||= StorePresenter.new(filter)
    end
end
