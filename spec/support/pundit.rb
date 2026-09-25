require 'pundit/rspec'

# enable pundit use syntax in specs
RSpec.configure do |config|
  config.include Pundit::Rspec::DSL, type: :policy
end
