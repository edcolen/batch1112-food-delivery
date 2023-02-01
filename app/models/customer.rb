class Customer
  attr_accessor :id, :name, :address

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def self.create_headers
    %w[id name address]
  end

  def to_csv_row
    [@id, @name, @address]
  end
end
