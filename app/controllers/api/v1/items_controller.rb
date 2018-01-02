class Api::V1::ItemsController < Api::V1::ApplicationController

  def show
    item = Item.find(params[:id])
    render status: 200, json: item, except: [:created_at, :updated_at]
  end

end