class AutocompleteSuppliersPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_supplier
  end

private
  def find_supplier
    @suppliers = Supplier.search_by_name(@term)
    result(@suppliers)
  end

  def result(suppliers)
    resultset = suppliers.map do |supplier|
      {
        :id       => supplier.id,
        :label    => supplier.name
      }
    end
    resultset
  end
end