module MyBootstrapHelper
  def model_error_messages!(model)
    return '' if model.errors.empty?

    errors = model.errors.full_messages.map do |msg|
      content_tag(
        :div,
        content_tag(:button, raw('&times;'), class: 'close', 'data-dismiss' => 'alert') +
        msg.html_safe, :class => 'alert fade in alert-error'
      )
    end

    errors.join.html_safe

    #html.html_safe
  end
end