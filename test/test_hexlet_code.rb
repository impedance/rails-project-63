# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_makes_single_tag
    tag = Tag.build("br")
    assert_equal("<br>", tag)

    tag = Tag.build("img", src: "path/to/image")
    assert_equal('<img src="path/to/image">', tag)

    tag = Tag.build("input", type: "submit", value: "Save")
    assert_equal('<input type="submit" value="Save">', tag)
  end

  def test_it_makes_paired_tag
    tag = Tag.build("label") { "Email" }
    assert_equal("<label>Email</label>", tag)

    tag = Tag.build("label", for: "email") { "Email" }
    assert_equal('<label for="email">Email</label>', tag)

    tag = Tag.build("div", id: "root", value: "hello") { "Header" }
    assert_equal('<div id="root" value="hello">Header</div>', tag)

    tag = Tag.build("a", href: "https://nsa.gov", value: "hello")
    assert_equal('<a href="https://nsa.gov" value="hello"></a>', tag)
  end

  def test_it_makes_form_tag
    user = User.new(name: "Stark")

    tag = HexletCode.form_for user do |f|
    end
    assert_equal('<form action="#" method="post"></form>', tag)
  end

  def test_it_makes_form_with_attribute
    user = User.new(name: "Stark")

    tag = HexletCode.form_for user, url: "/users" do |f|
    end
    assert_equal('<form action="/users" method="post"></form>', tag)
  end

  def test_it_makes_form_using_object
    user = User.new name: "rob", job: "hexlet", gender: "m"
    actual_tag = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
      f.submit "Wow"
    end
    expected_tag = File.read("test/fixtures/using_object.html")

    assert_equal(expected_tag, actual_tag)
  end

  def test_it_raises_error_when_no_attribute_found
    user = User.new name: "rob", job: "hexlet", gender: "m"
    assert_raises NoMethodError do
      HexletCode.form_for(user) do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end

  def test_it_makes_form_with_hash_attributes
    user = User.new name: "rob", job: "hexlet", gender: "m"
    tag = HexletCode.form_for(user) do |f|
      f.input :name, class: "user-input"
      f.input :job
      f.submit
    end
    html_content = File.read("test/fixtures/hash_attributes.html")

    assert_equal(html_content, tag)
  end

  def test_it_makes_form_with_non_default_values
    user = User.new name: "rob", job: "hexlet", gender: "m"
    actual_tag = HexletCode.form_for user, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected_tag = File.read("test/fixtures/non_default_values.html")

    assert_equal(expected_tag, actual_tag)
  end
end
