require('spec_helper')

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end
end

describe("#name") do
    it("tells you its name") do
      client = Client.new({:name => "Bob", :id => nil})
      expect(client.name()).to(eq("Bob"))
    end
  end

describe("#id") do
  it("sets its ID when you save it") do
    client = Client.new({:name => "Bob", :id => nil})
    client.save()
    expect(client.id()).to(be_an_instance_of(Fixnum))
   end
 end
