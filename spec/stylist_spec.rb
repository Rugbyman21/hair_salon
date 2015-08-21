require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a stylist to the database") do
      test_stylist = Stylist.new({:name => "Terry", :client_id => 1})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#name") do
    it("lets you see the stylist name") do
      test_stylist = Stylist.new({:name => "Terry", :client_id => 1})
      expect(test_stylist.name()).to(eq("Terry"))
    end
  end

  describe("#client_id") do
    it("lets you resd the client ID") do
      test_stylist = Stylist.new({:name => "Terry", :client_id => 1})
      expect(test_stylist.client_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name and client ID") do
      stylist1 = Stylist.new({:name => "Terry", :client_id => 1})
      stylist2 = Stylist.new({:name => "Terry", :client_id => 1})
      expect(stylist1).to(eq(stylist2))
    end
  end
end
