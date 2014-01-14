module Feedstock::Outputs::ItemsHelper
  def change_color_tr(item)
    if item.negative?
      tag (:tr), class: "error"
    else
      tag :tr
    end
  end
end
