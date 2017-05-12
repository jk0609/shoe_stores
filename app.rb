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
  new_store = Store.new({:name=>params[:s_name]})
  if new_store.save
    @stores = Store.all
    erb(:index)
  else
    @stores = Store.all
    erb(:index_error)
  end
end

#all brands


#clean database
get('/kill') do
  Brand.destroy_all
  Shoe.destroy_all
  Store.destroy_all
  @stores = Store.all
  erb(:index)
end
