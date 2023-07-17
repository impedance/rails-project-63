# frozen_string_literal: true

require_relative 'base_input'

# Class for input tag
module HexletCode
  module Inputs
    class StringInput < BaseInput
      attr_reader :attrs

      def initialize(resource, name, attrs)
        super(resource, name)
        @attrs = attrs
      end
    end
  end
end
