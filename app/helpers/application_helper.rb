module ApplicationHelper
  def error_messages_for(resource)
    errors = resource.errors.full_messages
    render('shared/error_messages', :errors => errors) if errors.present?
  end
end
