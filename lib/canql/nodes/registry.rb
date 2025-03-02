# frozen_string_literal: true

module Canql # :nodoc: all
  module Nodes
    module RegistryNode
      def meta_data_item
        { 'patient.registry' => { Canql::EQUALS => registry.to_registrycode } }
      end
    end

    module ProcessingRegistryNode
      def meta_data_item
        subject = reverse_scan_for_marker(:subject) == 'mother' ? '.mother' : ''
        {
          "unprocessed_records#{subject}.processing_registry" => {
            Canql::EQUALS => registry.to_registrycode
          }
        }
      end
    end

    module RegistryCodeNode
      def to_registrycode
        text_value.upcase
      end
    end
  end
end
