class AutocompletePostalCodesPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_postal_code
  end

private
  def find_postal_code
    @postal_codes = PostalCode.search_by_cep(@term)
    result(@postal_codes) if @postal_codes
  end

  def result(postal_codes)
    resultset = postal_codes.map do |postal_code|
      {
        :id       => postal_code.id,
        :label    => postal_code.street
      }
    end
    resultset
  end
end