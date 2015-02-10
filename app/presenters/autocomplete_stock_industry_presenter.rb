class AutocompleteStockIndustryPresenter
  def initialize(term, criteria)
    @term = term
    @criteria = criteria
  end
  
  def as_json options={}
    find_product
  end

private
  def find_product
    @products = Product.search_by_name_in_industry(@term)
    result(@products)
  end

  def result(products)
    resultset = products.map do |product|
      {
        :id         => product.id,
        :label      => product.name,
        :price      => price(product)
      }
    end
    resultset
  end
  
  def price(product)
    if  @criteria.present? and @criteria === "Á vista" 
      product.wholesale
    else 
      product.wholesale_term
    end
  end
end