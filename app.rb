require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get("/clients/new") do
  erb(:client_form)
end

post("/clients") do
  name = params.fetch("name")
  client = Client.new({:name => name, :id => nil})
  client.save()
  erb(:client_success)
end

get("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client)
end
