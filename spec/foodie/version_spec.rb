require 'spec_helper'

RSpec.describe Foodie::VERSION do
  it 'has a version number' do
    expect(Foodie::VERSION).not_to be nil
  end
end
