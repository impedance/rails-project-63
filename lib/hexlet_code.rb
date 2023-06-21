# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  # Your code goes here...
  class Tag
    def self.build(tag, options = {})
      result = []
      result << tag
      result << build_options(options) if options.any?
      "<#{result.join(options.any? ? " " : "")}>"
    end

    def self.build_options(opts)
      opts.map { |key, value| "#{key}=\"#{value}\"" }
    end
  end
end
