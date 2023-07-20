# frozen_string_literal: true

# This module provides methods for building HTML
module HexletCode
  module Tag
    SINGLE_TAGS = %w[input img br].freeze

    def self.build(tag, attrs = {})
      store = build_attrs(attrs)
      return "<#{tag}#{store}>" if SINGLE_TAGS.include?(tag)

      body = yield
      "<#{tag}#{store}>#{body}</#{tag}>"
    end

    def self.build_attrs(attrs)
      return '' if attrs.empty?

      build_attrs = attrs.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      [' ', build_attrs].join
    end
  end
end
