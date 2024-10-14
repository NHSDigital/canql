# frozen_string_literal: true

module Canql # :nodoc: all
  module Nodes
    module Anomaly
      module WithCondition
        def anomaly_type
          natal_period.text_value.strip
        end

        def anomaly_status_type
          status_type.text_value.strip
        end

        def anomaly_screening_status_type
          screening_status_type.text_value.strip
        end

        def to_anomaly
          anomaly_hash = { 'exists' => existence_filter }
          anomaly_hash['type'] = anomaly_type_filter if anomaly_type.present?
          anomaly_hash['status'] = anomaly_status_type_filter if anomaly_status_type.present?
          if anomaly_screening_status_type.present?
            anomaly_hash['screening_status'] = anomaly_screening_status_type_filter
          end
          code_filters(anomaly_hash)

          anomaly_hash
        end

        def code_filters(anomaly_hash)
          anomaly_hash['icd_codes'] = code_filter[:icd_code] if code_filter[:icd_code].present?
          anomaly_hash['code_groups'] = code_filter[:code_group] if code_filter[:code_group].present?
          return if code_filter[:fasp_rating].blank?

          anomaly_hash['fasp_rating'] = code_filter[:fasp_rating]
        end

        def existence_filter
          { Canql::EQUALS => existence_modifier.text_value.strip != 'no' }
        end

        def anomaly_type_filter
          { Canql::EQUALS => anomaly_type }
        end

        def anomaly_status_type_filter
          { Canql::EQUALS => anomaly_status_type }
        end

        def anomaly_screening_status_type_filter
          { Canql::EQUALS => anomaly_screening_status_type }
        end

        def code_type(code)
          return :icd_code if code.respond_to?(:to_code) && code.to_code.present?
          return :code_group if code.respond_to?(:to_code_group) && code.to_code_group.present?
          return :fasp_rating if code.respond_to?(:to_fasp_rating) && code.to_fasp_rating.present?

          raise 'Unable to find code type'
        end

        def code_value(code)
          return code.to_code if :icd_code == code_type(code)
          return code.to_code_group if :code_group == code_type(code)

          code.to_fasp_rating
        end

        def prepare_code_filters(code_array)
          clean_code_array(code_array)

          code_filters = {}
          code_filters[:icd_code] = { Canql::BEGINS => code_array[:icd_code] } if code_array[:icd_code].any?
          code_filters[:code_group] = { Canql::EQUALS => code_array[:code_group] } if code_array[:code_group].any?
          code_filters[:fasp_rating] = { Canql::EQUALS => code_array[:fasp_rating] } if code_array[:fasp_rating].any?

          code_filters
        end

        def clean_code_array(code_array)
          code_array[:icd_code].flatten!
          code_array[:icd_code].compact_blank!
          code_array[:code_group].flatten!
          code_array[:code_group].compact_blank!
          code_array[:fasp_rating].flatten!
          code_array[:fasp_rating].compact_blank!
        end

        def code_filter
          return {} if code_data.text_value.blank?

          code_arrays = { icd_code: [], code_group: [], fasp_rating: [] }
          code_arrays[code_type(code_data.first)] << code_value(code_data.first)
          code_data.rest.elements.each do |code|
            code_arrays[code_type(code)] << code_value(code)
          end
          prepare_code_filters(code_arrays)
        end
      end

      module AdditionalCodeNode
        def code_type
          return :icd_code if anomalies_icd_code.respond_to?(:to_code)
          return :code_group if anomalies_icd_code.respond_to?(:to_code_group)

          :fasp_rating
        end

        def to_code
          anomalies_icd_code.to_code if :icd_code == code_type
        end

        def to_code_group
          anomalies_icd_code.to_code_group if :code_group == code_type
        end

        def to_fasp_rating
          anomalies_icd_code.to_fasp_rating if :fasp_rating == code_type
        end
      end

      module SingleIcdCodeNode
        def to_code
          text_value.upcase
        end
      end

      module SingleCodeGroupNode
        def to_code_group
          text_value.gsub(/( )/, '_').upcase
        end
      end

      module SingleFaspRatingNode
        def to_fasp_rating
          text_value.gsub(/( )/, '_').upcase.split('_AND_').map do |value|
            value.start_with?('FASP_') ? value : "FASP_#{value}"
          end
        end
      end
    end
  end
end
