class AutocompleteFeedstocksPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_feedstock
  end

private
  def find_feedstock
    @feedstocks = Feedstock.search_by_name(@term)
    result(@feedstocks)
  end

  def result(feedstocks)
    resultset = feedstocks.map do |feedstock|
      {
        :id       => feedstock.id,
        :label    => feedstock.name
      }
    end
    resultset
  end
end