# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module TestResultGroup
      module WithCondition
        def test_result_group
          group.text_value.strip.parameterize.underscore
        end

        def to_test_result_group
          test_result_group_hash = { 'exists' => existance_filter }
          test_result_group_hash['required'] = requirement_filter
          test_result_group_hash['group'] = test_result_group_filter if test_result_group.present?
          test_result_group_hash
        end

        def existance_filter
          {
            Canql::EQUALS => ['supplied required', 'supplied'].include?(
              existance_modifier.text_value.strip
            )
          }
        end

        def requirement_filter
          {
            Canql::EQUALS => ['supplied required', 'missing required'].include?(
              existance_modifier.text_value.strip
            )
          }
        end

        def test_result_group_filter
          { Canql::EQUALS => test_result_group }
        end
      end
    end
  end
end
