# frozen_string_literal: true

# Provides test functionaly for test oin anomaly CANQL clauses
module AnomalyTestHelper
  private

  def assert_anomaly_values(parser, index = 0, expected = {})
    assert_dir_block_values(
      parser, 'anomalies',
      %w[exists type status fasp_rating icd_codes code_groups screening_status],
      index, expected
    )
  end

  def assert_anomaly_count(parser, number_of_blocks)
    assert_dir_block_count(parser, 'anomalies', number_of_blocks)
  end
end
