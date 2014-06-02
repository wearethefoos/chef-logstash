require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  # Specify the Chef log_level (default: :warn)
  config.log_level = :warn

  before :each do
    config.platform = 'ubuntu'
    config.version = '12.04'
  end

  before :each, ubuntu: true do
    config.platform = "ubuntu"
    config.version = "12.04"
  end

  before :each, amazon: true do
    config.platform = "amazon"
    config.version  = "2014.3"
  end
end

