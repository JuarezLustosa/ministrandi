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
        :id           => postal_code.id,
        :label        => postal_code.cep,
        :street       => postal_code.street,
        :street_type  => postal_code.street_type,
        :neighborhood => postal_code.neighborhood,
        :city         => postal_code.city,
        :state        => postal_code.state
      }
    end
    resultset
  end
end