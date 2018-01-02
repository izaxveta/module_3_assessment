class Api::V1::ItemsController < Api::V1::ApplicationController

  def show
    item = Item.find(params[:id])
    render status: 200, json: item, except: [:created_at, :updated_at]
  end

  def create
    item = Item.create(item_params)
    render status: 201, json: {
      item: item, except: [:created_at, :updated_at]
    }
  end

  def destroy
    item = Item.find(params[:id])
    render json: {
      message: "Successfully deleted item #{item.id}.",
      status: 204
    }
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end

end