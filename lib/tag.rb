  # frozen_string_literal: true
  module Tag
    SINGLE_TAGS = %w[input img br].freeze

    def self.hello
      puts "HELLLLLOO"
    end

    def self.build(tag, attrs = {})
      store = []
      store << tag
      store << build_attrs(attrs) if attrs.any?
      prepared_tags = "<#{store.join(attrs.any? ? " " : "")}>"

      return prepared_tags if SINGLE_TAGS.include?(tag)

      "#{prepared_tags}#{yield if block_given?}</#{tag}>"
    end

    def self.build_attrs(attrs)
      attrs.map { |key, value| "#{key}=\"#{value}\"" }
    end
  end
