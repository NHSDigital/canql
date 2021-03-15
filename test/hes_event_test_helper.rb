# frozen_string_literal: true

# Provides test functionaly for test on hes events CANQL clauses
module HesEventTestHelper
  private

  def assert_hes_values(parser, index = 0, expected = {})
    assert_dir_block_values(parser, 'hes_events', %w[exists], index, expected)
  end

  def assert_hes_count(parser, numder_of_blocks)
    assert_dir_block_count(parser, 'hes_events', numder_of_blocks)
  end
end
