require 'spec_helper'

RSpec.describe 'Testing CLI commands', type: :aruba do
  it 'contains Gross!' do
    run('foodie portray broccoli')
    expect(last_command_started).to have_output 'Gross!'
  end

  it 'pluralizes tomato' do
    run('foodie pluralize --word Tomato')
    expect(last_command_started).to have_output 'Tomatoes'
  end
end
