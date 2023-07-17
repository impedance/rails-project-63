# frozen_string_literal: true


# Class for input tag
module HexletCode
  module Inputs
    autoload :BaseInput, 'hexlet_code/inputs/base_input'

    class StringInput < BaseInput
      attr_reader :attrs

      def initialize(resource, name, attrs)
        super(resource, name)
        @attrs = attrs
      end
    end
  end
end
