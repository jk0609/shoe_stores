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
  @new_store = Store.new({:name=>params[:s_name]})
  if @new_store.save
    @stores = Store.all
    erb(:index)
  else
    @stores = Store.all
    erb(:index_error)
  end
end

#all brands
get('/brands') do
  @brands = Brand.all
  erb(:all_brands)
end
post('/') do
  new_brand = Brand.new({:name=>params[:b_name], :price=>params[:b_price].to_f})
  if new_brand.save
    @brands = Brand.all
    erb(:all_brands)
  else
    @brands = Brand.all
    erb(:all_brands_error)
  end
end

#clean database
get('/kill') do
  Brand.destroy_all
  Shoe.destroy_all
  Store.destroy_all
  @stores = Store.all
  erb(:index)
end
