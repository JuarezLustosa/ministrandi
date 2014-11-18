class AutocompleteProductsPresenter
  def initialize(term)
    @term = term
  end
  
  def as_json options={}
    find_product
  end

private
  def find_product
    @products = Product.search_by_name_or_cod(@term)
    result(@products)
  end

  def result(products)
    resultset = products.map do |product|
      {
        :id         => product.id,
        :label      => product.name,
        :wholesale  => product.wholesale
      }
    end
    resultset
  end
end