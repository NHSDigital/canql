# frozen_string_literal: true

# Provides test functionality for test on events CANQL clauses
module EventsTestHelper
  private

  def assert_events_values(parser, subject, event_name, index = 0, expected = {})
    assert_dir_block_values(parser, "#{subject}.#{event_name}", %w[exists], index, expected)
  end

  def assert_events_count(parser, subject, event_name, number_of_blocks)
    assert_dir_block_count(parser, "#{subject}.#{event_name}", number_of_blocks)
  end
end
