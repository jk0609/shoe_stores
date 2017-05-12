require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload('lib/**/*.rb')


#clean database
get('/kill') do
  Brand.destroy_all
  Shoe.destroy_all
  Store.destroy_all
  erb(:index)
end
