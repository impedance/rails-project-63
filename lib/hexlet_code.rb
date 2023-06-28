# frozen_string_literal: true

autoload :Tag, "hexlet_code/tag"
require_relative "hexlet_code/version"

# This module provides methods for building HTML
module HexletCode
  class Error < StandardError; end

  def self.form_for(_attrs, url: "#")
    Tag.build("form", action: url, method: "post") { yield if block_given? }
  end
end
