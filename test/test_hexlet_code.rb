# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_it_makes_br_tag
    tag = HexletCode::Tag.build("br")
    assert_equal("<br>", tag)
  end

  def test_it_makes_img_tag
    tag = HexletCode::Tag.build("img", src: "path/to/image")
    assert_equal('<img src="path/to/image">', tag)
  end
end
