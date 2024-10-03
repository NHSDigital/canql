# frozen_string_literal: true

module Canql # :nodoc: all
  module Nodes
    module GeneticTest
      module WithCondition
        def to_genetic_test
          { 'exists' => existence_filter }
        end

        def existence_filter
          { Canql::EQUALS => existence_modifier.text_value.strip != 'no' }
        end
      end
    end
  end
end
