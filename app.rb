require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload('lib/**/*.rb')

#all stores
get('/') do
  @stores = Store.all
  erb(:index)
end
post('/') do
  @new_store = Store.create({:name=>params[:s_name]})
  @stores = Store.all
  erb(:index)
end

#one store
get('/stores/:s_id') do
  @store = Store.find(params[:s_id].to_i)
  erb(:one_store)
end
post('/stores/:s_id') do
  @store = Store.find(params[:s_id].to_i)
  params[:b_ids].each do |id|
    @store.brands.push(Brand.find(id.to_i))
  end
  erb(:one_store)
end
patch('/stores/:s_id') do
  @store = Store.find(params[:s_id].to_i)
  params[:b_ids].each do |id|
    @store.brands.destroy(Brand.find(id.to_i))
  end
  erb(:one_store)
end

#all brands
get('/brands') do
  @brands = Brand.all
  erb(:all_brands)
end
post('/brands') do
  @new_brand = Brand.create({:name=>params[:b_name], :price=>params[:b_price]})
  @brands = Brand.all
  erb(:all_brands)
end

#clean database
get('/kill') do
  Brand.destroy_all
  Shoe.destroy_all
  Store.destroy_all
  @stores = Store.all
  erb(:index)
end
