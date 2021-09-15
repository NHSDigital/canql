# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module BatchTypeNode
      def to_type
        string = respond_to?(:normalise) ? normalise : text_value
        string.upcase
      end
    end

    module PaediatricNode
      def normalise
        'paediatric'
      end
    end

    module Enote2Node
      def normalise
        'enote2'
      end
    end

    module BadgerNode
      def normalise
        'badger'
      end
    end

    module UcytoNode
      def normalise
        'ucyto'
      end
    end

    module NiptNode
      def normalise
        'nipt'
      end
    end

    module BiochemNode
      def normalise
        'biochem'
      end
    end

    module HesNode
      def normalise
        'hes'
      end
    end

    module UssNode
      def normalise
        'uss'
      end
    end

    module RddeathNode
      def normalise
        'rd_death'
      end
    end

    module UmumNode
      def normalise
        'umum'
      end
    end

    module CADeathNode
      def normalise
        'ca_death'
      end
    end
  end
end
