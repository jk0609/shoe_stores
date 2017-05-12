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
