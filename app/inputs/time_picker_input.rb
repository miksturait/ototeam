class TimePickerInput < SimpleForm::Inputs::StringInput
  def input
    value = object.send(attribute_name) if object.respond_to? attribute_name
    display_pattern = I18n.t('timepicker.dformat', :default => '%R')
    input_html_options[:value] ||= I18n.localize(value, :format => display_pattern) if value.present?

    input_html_options[:type] = 'text'
    picker_pettern = I18n.t('timepicker.pformat', :default => 'hh:mm')
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ format: picker_pettern, language: I18n.locale.to_s,
                                       date_weekstart: I18n.t('datepicker.weekstart', :default => 0) })

    template.content_tag :div, class: 'input-group date timepicker' do
      #input = super # leave StringInput do the real rendering
      input_html_options[:as] = 'string' # add this to avoid simple_form bug
      input = @builder.input_field(attribute_name, input_html_options)
      input += template.content_tag :span, class: 'input-group-addon' do
        template.content_tag :span, '', class: 'glyphicon glyphicon-time', data: { 'time-icon' => 'glyphicon-time', 'date-icon' => 'glyphicon-calendar' }
      end
      input
    end
  end
end