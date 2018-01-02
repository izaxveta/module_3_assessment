require 'rails_helper'

RSpec.describe 'Items API' do
  let(:item_1) { Item.create(name: "Fantastic Linen Shirt",
                description: "Beatae doloremque praesentium. Et tempora est accusantium ut odio quis. Ad molestiae et sint rerum. Nisi et impedit rem sint et temporibus.",
                image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")}


  let(:item_2) { Item.create(name: "Fantastic Linen Skirt",
                description: "Beatae doloremque praesentium. Et tempora est accusantium ut odio quis. Ad molestiae et sint rerum. Nisi et impedit rem sint et temporibus.",
                image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")}

  it 'can obtain a single item response' do
    item_1

    get "/api/v1/items/#{item_1.id}"

    content = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(content['id']).to eq(item_1.id)
    expect(content['name']).to eq(item_1.name)
    expect(content['description']).to eq(item_1.description)
    expect(content['image_url']).to eq(item_1.image_url)
    expect(content['created_at']).to be_nil
    expect(content['updated_at']).to be_nil
  end

  it 'can delete an item record response' do
    item_1
    item_2

    delete "/api/v1/items/#{item_2.id}"

    content = JSON.parse(response.body)

    expect(content['status']).to eq(204)
    expect(content['message']).to eq("Successfully deleted item #{item_2.id}.")
    expect(Item.count).to eq(1)
  end

  it 'can create an item record response' do
    post '/api/v1/items', params: { item: { name: "Fantastic Linen Skirt",
                                            description: "Beatae doloremque praesentium. Et tempora est accusantium ut odio quis. Ad molestiae et sint rerum. Nisi et impedit rem sint et temporibus.",
                                            image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200"} }

    content = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(content['name']).to eq("Fantastic Linen Skirt")
    expect(content['created_at']).to be_nil
    expect(content['updated_at']).to be_nil
    expect(Item.count).to eq(1)
  end
end