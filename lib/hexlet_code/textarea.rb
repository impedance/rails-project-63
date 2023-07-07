# frozen_string_literal: true

autoload :BaseInput, "hexlet_code/base_input"

# Class for input tag
class Textarea < BaseInput
  attr_reader :cols, :rows

  def initialize(resource, name, attrs)
    super(resource, name)
    @cols = attrs[:cols] || 20
    @rows = attrs[:rows] || 40
  end

  def build
    Tag.build("textarea", name: name, cols: cols, rows: rows) { resource[name] }
  end
end
