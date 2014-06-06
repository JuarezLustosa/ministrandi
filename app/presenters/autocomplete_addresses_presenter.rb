class AutocompleteAddressesPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_addresses
  end

private
  def find_addresses
    @addresses = Address.search_by_street(@term)
    result(@addresses)
  end

  def result(addresses)
    resultset = addresses.map do |address|
      {
        :id       => address.id,
        :label    => address.street
      }
    end
    resultset
  end
end