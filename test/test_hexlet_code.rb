# frozen_string_literal: true

require "test_helper"
autoload :Tag, "tag"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_makes_single_tag
    tag = HexletCode::Tag.build("br")
    assert_equal("<br>", tag)

    tag = HexletCode::Tag.build("img", src: "path/to/image")
    assert_equal('<img src="path/to/image">', tag)

    tag = HexletCode::Tag.build("input", type: "submit", value: "Save")
    assert_equal('<input type="submit" value="Save">', tag)
  end

  def test_it_makes_paired_tag
    tag = HexletCode::Tag.build("label") { "Email" }
    assert_equal("<label>Email</label>", tag)

    tag = HexletCode::Tag.build("label", for: "email") { "Email" }
    assert_equal('<label for="email">Email</label>', tag)

    tag = HexletCode::Tag.build("div", id: "root", value: "hello") { "Header" }
    assert_equal('<div id="root" value="hello">Header</div>', tag)

    tag = HexletCode::Tag.build("a", href: "https://nsa.gov", value: "hello")
    assert_equal('<a href="https://nsa.gov" value="hello"></a>', tag)
  end
end
