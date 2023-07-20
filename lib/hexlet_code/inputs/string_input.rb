# frozen_string_literal: true

# Class for input tag
module HexletCode
  class StringInput < BaseInput
    attr_reader :attrs

    def initialize(resource, name, attrs)
      super(resource, name)
      @attrs = attrs
    end

    def render
      [
        make_label,
        Tag.build('input', name:, type: 'text', value: resource[name], **attrs)
      ]
    end
  end
end
