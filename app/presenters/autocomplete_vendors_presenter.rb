class AutocompleteVendorsPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_vendor
  end

private
  def find_vendor
    @vendors = User.search_by_name(@term).vendor
    result(@vendors)
  end

  def result(vendors)
    resultset = vendors.map do |vendor|
      {
        :id       => vendor.id,
        :label    => vendor.name
      }
    end
    resultset
  end
end