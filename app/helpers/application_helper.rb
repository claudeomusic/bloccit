module ApplicationHelper
  def form_group_tag(errors)
    if errors.any?
      'has-error'
    end
  end
end


