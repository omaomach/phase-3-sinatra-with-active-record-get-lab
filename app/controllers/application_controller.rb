class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'

  get "/bakeries" do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get "/bakeries/:id" do 
    single_bakery = Bakery.find(params[:id])
    single_bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do 
    baked_goods_by_price = BakedGood.all.order("price DESC")
    baked_goods_by_price.to_json
  end

  get "/baked_goods/most_expensive" do
    most_expensive = BakedGood.order("price DESC").first
    most_expensive.to_json
  end

end
