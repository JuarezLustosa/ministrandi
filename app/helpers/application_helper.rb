module ApplicationHelper
  def error_messages_for(resource)
    errors = resource.errors.full_messages
    render('shared/error_messages', :errors => errors) if errors.present?
  end
    
  def date_translation(date)
    l(date) if date.present?
  end
  
  def nested_options(collection, mover = nil)
    collection = collection.arrange if collection.is_a?(Class) || collection.is_a?(ActiveRecord::Relation)
    collection.inject([]) do |memo, (root, nodes)|
      if mover.nil? || mover.move_possible?(root)
        memo << ["#{'&nbsp;' * root.depth * 4} #{h root}".html_safe, root.id]
        memo.concat nested_options(nodes, mover)
      else
        memo
      end
    end
  end
end
