class AutocompleteClientsPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_client
  end

private
  def find_client
    @clients = Client.search_by_name(@term)
    result(@clients)
  end

  def result(clients)
    resultset = clients.map do |client|
      {
        :id             => client.id,
        :label          => client.name,
        :city_name      => client.city_name,
        :address        => client.address_complete,
        :fantasy_name   => client.fantasy_name,
        :phone          => client.phone1,
        :email          => client.email,
        :vendor_name    => client.vendor_name,
        :vendor_id      => client.vendor_id
      }
    end
    resultset
  end
end