# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module Events
      module WithCondition
        def to_events
          { "#{event_type_name}_event" => existence_filter }
        end

        def event_type_name
          map = {
            'birth' => 'birth',
            'death' => 'death',
            'hes' => 'hes',
            'preg loss hes' => 'pregnancy_loss_hes',
            'pregnancy loss hes' => 'pregnancy_loss_hes',
            'preg loss bpas' => 'pregnancy_loss_bpas',
            'pregnancy loss bpas' => 'pregnancy_loss_bpas',
            'msds' => 'msds'
          }
          map[event_type.text_value.strip]
        end

        def existence_filter
          { Canql::EQUALS => existance_modifier.text_value.strip != 'no' }
        end
      end
    end
  end
end
