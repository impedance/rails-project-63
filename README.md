![CI status](https://github.com//impedance/rails-project-63/actions/workflows/main.yml/badge.svg)
![CI status](https://github.com//impedance/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)
# HexletCode

Best HTML form generator for Ruby you ever seen.

## Installation
 
Setup gem by adding it to Gemfile using following command

    $ bundle add hexlet_code --git 'https://github.com/impedance/rails-project-63.git'

## How to use
```ruby

require 'hexlet_code'

User = Struct.new(:name, :job)
user = User.new name: 'rob', job: 'rosa'

HexletCode.form_for user, url: '#' do |f|
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <label for="job">Job</label>
#   <textarea cols="20" name="job" rows="40">rosa</textarea>
# </form>

```

## Development

    $ make install # => testing your app


## License

Full and exclusive rights on all data structures and algorithms is own by me, you can use it after hundred percent prepayment to me, thanks. Faithfully Yours.

