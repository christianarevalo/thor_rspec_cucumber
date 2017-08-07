require_relative '../../spec_helper'

RSpec.describe 'Check Recipes are generated', type: :aruba do
  let(:directory) {'dinner'}
  let(:recipe) {'steak'}
  let(:command) {'foodie recipe'}
  let(:instructions_file) {"#{directory}/#{recipe}_instructions.txt"}
  let(:ingredients_file) {"#{directory}/#{recipe}_ingredients.txt"}
  let(:files) {[instructions_file, ingredients_file]}

  let(:instructions_content) {
    "##### Instructions #####\nTips on how to make delicious steak go here."
  }
  let(:ingredients_content) {
    "##### Ingredients #####\nIngredients for delicious steak go here."
  }

  before(:each) do
    run("#{command} #{directory} #{recipe}")
    expect(last_command_started).to be_successfully_executed
  end

  it 'generates folder and files' do
    expect(directory?(directory)).to be true
    files.each_with_index do |file|
      expect(exist?(file)).to be true
    end
  end

  it 'contains recipe instructions' do
    expect(instructions_file).to have_file_content instructions_content
  end

  it 'contains recipe ingredients' do
    expect(ingredients_file).to have_file_content ingredients_content
  end
end