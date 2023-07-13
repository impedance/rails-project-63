# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_makes_form_tag
    user = User.new(name: 'Stark')

    tag = HexletCode.form_for user
    assert_equal('<form action="#" method="post"></form>', tag)
  end

  def test_it_makes_form_with_attribute
    user = User.new(name: 'Stark')

    tag = HexletCode.form_for user, url: '/users'
    assert_equal('<form action="/users" method="post"></form>', tag)
  end

  def test_it_makes_form_using_object
    user = User.new job: 'hexlet', gender: 'm'
    actual_tag = HexletCode.form_for(user, url: '#', method: :get) do |f|
      f.input :name
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit 'Wow'
    end
    expected_tag = File.read('test/fixtures/using_object.html')

    assert_equal(expected_tag, actual_tag)
  end

  def test_it_raises_error_when_no_attribute_found
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    assert_raises NoMethodError do
      HexletCode.form_for(user) do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end

  def test_it_makes_form_with_hash_attributes
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    tag = HexletCode.form_for(user) do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    html_content = File.read('test/fixtures/hash_attributes.html')

    assert_equal(html_content, tag)
  end

  def test_it_makes_form_with_non_default_values
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    actual_tag = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected_tag = File.read('test/fixtures/non_default_values.html')

    assert_equal(expected_tag, actual_tag)
  end

  def test_it_makes_form_with_options
    user = User.new name: 'rob'

    actual = HexletCode.form_for user, url: '/profile', method: :get, class: 'hexlet-form', &:submit

    expected_tag = File.read('test/fixtures/form_with_options.html')
    assert_equal(expected_tag, actual)
  end
end
