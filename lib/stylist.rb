class Stylist
  attr_reader(:name, :client_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @client_id = attributes.fetch(:client_id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylist;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      client_id = stylist.fetch("client_id").to_i()
      stylists.push(Stylist.new({:name => name, :client_id => client_id}))
    end
    stylists
  end

  define_method(:save) do
    DB.exec("INSERT INTO stylist (name, client_id) VALUES ('#{@name}', #{@client_id});")
  end

  define_method(:==) do |another_stylist|
      self.name().==(another_stylist.name()).&(self.client_id().==(another_stylist.client_id()))
  end
end
