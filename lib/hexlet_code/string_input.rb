# frozen_string_literal: true

autoload :BaseInput, 'hexlet_code/base_input'

# Class for input tag
class StringInput < BaseInput
  attr_reader :attrs

  def initialize(resource, name, attrs)
    super(resource, name)
    @attrs = attrs
  end
end
