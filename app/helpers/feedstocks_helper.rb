module FeedstocksHelper
  def color_tr(feedstock)
    if feedstock.critic_stock?
      tag (:tr), class: "error"
    elsif feedstock.min_stock?
      tag (:tr), class: "warning"
    else
      tag :tr
    end
  end
end
