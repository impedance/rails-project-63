# frozen_string_literal: true

require_relative 'base_input'

# Class for input tag
module HexletCode
  class StringInput < BaseInput
    attr_reader :attrs

    def initialize(resource, name, attrs)
      super(resource, name)
      @attrs = attrs
    end
  end
end
