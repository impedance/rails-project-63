# frozen_string_literal: true

autoload :Tag, "hexlet_code/tag"
require_relative "hexlet_code/version"

# This module provides methods for building HTML
module HexletCode
  class Error < StandardError; end

  def self.form_for(attrs, url: "#")
    Tag.build("form", action: url, method: "post") do
      puts "!" * 10
      puts yield(attrs)
      yield if block_given? 
      puts "!" * 10
    end
  end
end
