require('spec_helper')

describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you clients name") do
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

  describe("#save") do
    it("lets you save client to the database") do
      client = Client.new({:name => "Bob", :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name") do
      client1 = Client.new({:name => "Bob", :id => nil})
      client2 = Client.new({:name => "Bob", :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe(".find") do
    it("returns a client by its ID") do
      test_client = Client.new({:name => "Bob", :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Mary", :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#stylist") do
    it("returns a stylist a client has gone too") do
      test_client = Client.new({:name => "Bob", :id => nil})
      test_client.save()
      test_stylist = Stylist.new({:name => "Terry", :client_id => test_client.id()})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Kaylin", :client_id => test_client.id()})
      test_stylist2.save()
      expect(test_client.stylists()).to(eq([test_stylist, test_stylist2]))
    end
  end
end
