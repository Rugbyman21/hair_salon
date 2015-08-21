class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_client = DB.exec("SELECT * FROM client;")
    clients = []
    returned_client.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      client.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

  define_method(:save) do
   result = DB.exec("INSERT INTO client (name) VALUES ('#{@name}') RETURNING id;")
   @id = result.first().fetch("id").to_i()
 end
end
