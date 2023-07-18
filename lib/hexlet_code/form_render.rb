# frozen_string_literal: true

# Rendering form module
module HexletCode
  module FormRender
    def self.render_html(form)
      @result = [Tag.build('form', form[:form_options])]
      @result << build_inputs(form[:inputs]) if form[:inputs].any?
      @result << Tag.build('input', type: 'submit', value: form[:submit][:value]) if form[:submit]
      @result << '</form>'
      @result.join
    end

    def self.build_inputs(inputs)
      inputs.map do |input|
        [Tag.build('label', for: input.name) { input.name.capitalize },
         prepare_tags(input, input.resource, input.name)].join
      end
    end

    def self.prepare_tags(tag, resource, name)
      if tag.instance_of?(HexletCode::TextInput)
        Tag.build('textarea', name:, cols: tag.cols, rows: tag.rows) do
          resource[name]
        end
      else
        Tag.build('input', name:, type: 'text', value: resource[name], **tag.attrs)
      end
    end
  end
end
