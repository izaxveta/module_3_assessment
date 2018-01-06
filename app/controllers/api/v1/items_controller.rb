class Api::V1::ItemsController < Api::V1::ApplicationController
  before_action :set_item, only: [:show, :destroy, :update]

  def index
    render status: 200, json: Item.all, each_serializer: ItemSerializer
  end

  def show
    render status: 200, json: item, serializer: ItemSerializer
  end

  def create
    item = Item.create(item_params)
    render status: 201, json: item, serializer: ItemSerializer
  end

  def update
    item.update(item_params)
    render status: 202, json: item, serializer: ItemSerializer
  end

  def destroy
    item.destroy
    render json: {
      message: "Successfully deleted item #{item.id}.",
      status: 204    expect(content.first['created_at']).to be_nil
    }
  end

  private
    attr_reader :item

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end