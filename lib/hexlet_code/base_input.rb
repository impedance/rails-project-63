# frozen_string_literal: true

# Base module for html tags
# module HexletCode
class BaseInput
  attr_reader :resource, :name

  def initialize(resource, name)
    @resource = resource
    @name = name
  end
end
# end
