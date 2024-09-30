# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module Events
      module WithCondition
        def to_events
          event_type = text_values_for_marker(:event_type).first.strip
          event_relevance = text_values_for_marker(:event_relevance).first.to_s.strip
          hash = existence_filter
          hash['type'] = event_type_name[event_type]
          hash['relevant'] = event_relevance_flag(event_relevance) || false

          hash
        end

        def event_type_name
          {
            'birth' => 'birth',
            'death' => 'death',
            'hes' => 'hes',
            'preg loss hes' => 'pregnancy_loss_hes',
            'pregnancy loss hes' => 'pregnancy_loss_hes',
            'preg loss bpas' => 'pregnancy_loss_bpas',
            'pregnancy loss bpas' => 'pregnancy_loss_bpas',
            'msds' => 'msds'
          }
        end

        def event_relevance_flag(relevance)
          %w[linked relevant related].include?(relevance)
        end

        def existence_filter
          { Canql::EQUALS => existance_modifier.text_value.strip != 'no' }
        end
      end
    end
  end
end
