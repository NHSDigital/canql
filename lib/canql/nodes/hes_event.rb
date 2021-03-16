# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module HesEvent
      module WithCondition
        def to_hes
          { 'exists' => existance_filter }
        end

        def existance_filter
          { Canql::EQUALS => existance_modifier.text_value.strip != 'no' }
        end
      end
    end
  end
end
