require 'thor/group'
module Foodie
  module Generators
    class Recipe < Thor::Group
      include Thor::Actions

      argument :group, :type => :string
      argument :name, :type => :string

      def self.source_root
        File.dirname(__FILE__) + '/recipe'
      end

      def create_group
        empty_directory(group)
      end

      def copy_recipe
        template('recipe.txt', "#{group}/#{name}_instructions.txt")
      end

      def copy_ingredients
        template('ingredients.txt', "#{group}/#{name}_ingredients.txt")
      end
    end
  end
end