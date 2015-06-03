class OrdersDatatable
  delegate :params, :l, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Order.count,
      iTotalDisplayRecords: orders.total_entries,
      aaData: data
    }
  end

private

  def data
    orders.map do |order|
      [ 
        link_to(order.id, order),
        ERB::Util.h(order.client_name),
        ERB::Util.h(order.vendor_name),
        ERB::Util.h( l (order.date)),
        number_to_currency(order.total),
        ERB::Util.h(order.human_state_name),
        link_to("Visualizar", order, class: 'fa btn btn-default btn-sm')
      ]
    end
  end

  def orders
    @orders ||= fetch_orders
  end

  def fetch_orders
    orders = Order.order("#{sort_column} #{sort_direction}")
    orders = orders.page(page).per_page(per_page)      
    orders = search_orders(orders, params[:sSearch]) if params[:sSearch].present?
    orders
  end

  def search_orders(orders, term)
    search = orders.where(:id => term)
    search = orders.search_by_client_name(term) if search.empty?
    search
  end
 
  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id id id date total state id]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
