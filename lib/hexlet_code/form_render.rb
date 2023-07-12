# frozen_string_literal: true

# Rendering form module
# module HexletCode
module FormRender
  def self.render_html(form)
    form[:form_options]
    @result = [Tag.build('form', form[:form_options])]
    @result << build_inputs(form[:inputs]) if form[:inputs].any?
    @result << Tag.build('input', type: 'submit', value: form[:submit][:value]) if form[:submit]
    @result << '</form>'
    @result.join
  end

  def self.build_inputs(inputs)
    inputs.each do |input|
      @result << Tag.build('label', for: input.name) { input.name.capitalize }
      @result << Tag.build('input', name: input.name, type: 'text', value: input.resource[input.name], **input.attrs)
    end
  end

  def build
    result = [Tag.build('label', for: name) { name.capitalize }]
    result << Tag.build('textarea', name:, cols:, rows:) { resource[name] }
    result.join
  end

  # def build
  #   result = [Tag.build('label', for: name) { name.capitalize }]
  #   result << Tag.build('input', name:, type: 'text', value: resource[name], **attrs)
  #   result.join
  # end
end
# end
