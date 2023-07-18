# frozen_string_literal: true

# Class for input tag
module HexletCode
  class TextInput < BaseInput
    attr_reader :cols, :rows

    def initialize(resource, name, attrs)
      super(resource, name)
      @cols = attrs[:cols] || 20
      @rows = attrs[:rows] || 40
    end
  end
end
