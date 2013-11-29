class AutocompleteCitiesPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_city
  end

private
  def find_city
    @cities = City.search_by_name(@term)
    result(@cities) if @cities
  end

  def result(cities)
    resultset = cities.map do |city|
      {
        :id           => city.id,
        :label        => city.name
      }
    end
    resultset
  end
end