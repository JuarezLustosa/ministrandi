class AutocompleteProductsPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_product
  end

private
  def find_product
    @products = Product.search_by_name(@term)
    result(@products)
  end

  def result(products)
    resultset = products.map do |product|
      {
        :id       => product.id,
        :label    => product.name
      }
    end
    resultset
  end
end