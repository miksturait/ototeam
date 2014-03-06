# define following in simple_form.rb
# config.label_class = 'control-label col-lg-2'

inputs = %w[
  CollectionSelectInput
  FileInput
  GroupedCollectionSelectInput
  NumericInput
  PasswordInput
  RangeInput
  StringInput
  TextInput
]

inputs.each do |input_type|
  superclass = "SimpleForm::Inputs::#{input_type}".constantize
  new_class = Class.new(superclass) do
    def input_html_classes
      super.push('form-control')
    end
  end
  Object.const_set(input_type, new_class)
end

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.boolean_style = :nested
  config.wrappers :bootstrap3_horizontal, tag: 'div', class: 'form-group', error_class: 'has-error',
                  defaults: { input_html: { class: 'form-group default_class' } } do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label

    b.wrapper tag: 'div', class: 'col-sm-7' do |input_block|
      input_block.use :input
      input_block.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    end
    b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
  end

  config.wrappers :search_form, tag: 'div', class: 'form-group', error_class: 'has-error',
                  defaults: { input_html: { class: 'form-group default_class' } } do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.wrapper tag: 'div' do |input_block|
      input_block.use :input
      input_block.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.default_wrapper = :bootstrap3_horizontal
end
