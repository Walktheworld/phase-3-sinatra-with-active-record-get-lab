class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    des_goods = BakedGood.by_price
    des_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    exp_good = BakedGood.by_price.first
  
    exp_good.to_json
  end

end