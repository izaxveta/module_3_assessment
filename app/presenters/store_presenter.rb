class StorePresenter

  def present_store_search(zip)
    stores_data = store_service.store_search(zip)
    stores = stores_data['stores'].map { |data| Store.new(data) }
    total = stores_data['total']
    [stores, total]
  end

  private

    def store_service
      @store_service ||= StoreServices.new
    end

end