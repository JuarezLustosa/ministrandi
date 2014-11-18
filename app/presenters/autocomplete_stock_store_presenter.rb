class AutocompleteStockStorePresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_product
  end

private
  def find_product
    @products = Product.search_by_name_in_store(@term)
    result(@products)
  end

  def result(products)
    resultset = products.map do |product|
      {
        :id            => product.id,
        :label         => product.name,
        :retail_price  => product.retail_price
      }
    end
    resultset
  end
end
