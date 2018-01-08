class StorePresenter
  def initialize(filter = {})
    @filter = filter
    @stores_data = get_stores_data
  end

  def stores
    raw_data = stores_data['stores']
    generate_stores(raw_data)
  end

  def total
    stores_data['total']
  end

  def generate_stores(raw_data)
    raw_data.map { |data| Store.new(data) }
  end

  private
    attr_reader :filter, :stores_data

    def get_stores_data
      store_service.get_stores_search(filter)
    end

    def store_service
      @store_service ||= StoreServices.new
    end
end