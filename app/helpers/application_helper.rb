module ApplicationHelper
  def field_error(record, field)
    return if record.errors[field].blank?

    attribute_name = record.class.human_attribute_name(field)

    content_tag(:div, class: "field-error") do
      record.errors[field].each do |msg|
        concat(content_tag(:small, "#{attribute_name} #{msg}", style: "color: red;"))
      end
    end
  end
end
