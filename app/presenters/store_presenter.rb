class StorePresenter
  def initialize(filter = {})
    @filter = filter
  end

  def stores
    raw_data = store_service.get_stores_search(filter)['stores']
    generate_stores(raw_data)
  end

  def total
    stores_data = store_service.get_stores_search(filter)['total']
  end

  def generate_stores(stores_data)
    stores_data.map { |data| Store.new(data) }
  end

  private
    attr_reader :filter

    def store_service
      @store_service ||= StoreServices.new
    end
end