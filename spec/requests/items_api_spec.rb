require 'rails_helper'

RSpec.describe 'Items API' do
  let(:item) { Item.create(name: "Fantastic Linen Shirt",
                description: "Beatae doloremque praesentium. Et tempora est accusantium ut odio quis. Ad molestiae et sint rerum. Nisi et impedit rem sint et temporibus.",
                image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
            }

  it 'can obtain a single item response' do
    item

    get "/api/v1/items/#{item.id}"

    content = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(content['id']).to eq(item.id)
    expect(content['name']).to eq(item.name)
    expect(content['description']).to eq(item.description)
    expect(content['image_url']).to eq(item.image_url)
    expect(content['created_at']).to be_nil
    expect(content['updated_at']).to be_nil
  end
end