require("rspec")
require("pg")
require("client")
require("stylist")
require("pry")

DB = PG.connect({:dbname => "hair_salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM client *;")
    # DB.exec("DELETE FROM stylist *;")
  end
end
