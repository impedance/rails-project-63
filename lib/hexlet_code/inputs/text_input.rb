# frozen_string_literal: true

require_relative 'base_input'

# Class for input tag
module HexletCode
  module Inputs
    class TextInput < BaseInput
      attr_reader :cols, :rows

      def initialize(resource, name, attrs)
        super(resource, name)
        @cols = attrs[:cols] || 20
        @rows = attrs[:rows] || 40
      end
    end
  end
end
