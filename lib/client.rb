class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM client;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

  define_method(:save) do
   result = DB.exec("INSERT INTO client (name) VALUES ('#{@name}') RETURNING id;")
   @id = result.first().fetch("id").to_i()
 end

 define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.id().==(another_client.id()))
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      if client.id().==(id)
        found_client = client
      end
    end
    found_client
  end

  define_method(:stylist) do
    client_stylists = []
    stylist = DB.exec("SELECT * FROM stylist WHERE client_id = #{self.id()};")
    stylists.each() do |stylist|
      name = stylist.fetch("name")
      client_id = stylist.fetch("client_id").to_i()
      client_stylists.push(Stylist.new({:name => name, :client_id => client_id}))
    end
    client_stylists
  end
end
