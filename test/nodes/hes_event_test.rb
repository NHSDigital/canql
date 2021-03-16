# frozen_string_literal: true

require 'test_helper'
require 'hes_event_test_helper'

# case / patient hes tests
class HesEventTest < Minitest::Test
  include HesEventTestHelper

  def test_should_filter_cases_by_hes_events
    parser = Canql::Parser.new('all cases with hes events')
    assert parser.valid?
    assert_hes_count parser, 1
    assert_hes_values parser, 0, 'exists' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_hes_records
    parser = Canql::Parser.new('all cases with hes records')
    assert parser.valid?
    assert_hes_count parser, 1
    assert_hes_values parser, 0, 'exists' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_hes_events
    parser = Canql::Parser.new('all patients with hes events')
    assert parser.valid?
    assert_hes_count parser, 1
    assert_hes_values parser, 0, 'exists' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_hes_records
    parser = Canql::Parser.new('all patients with hes records')
    assert parser.valid?
    assert_hes_count parser, 1
    assert_hes_values parser, 0, 'exists' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_no_hes_events
    parser = Canql::Parser.new('all cases with no hes events')
    assert parser.valid?
    assert_hes_count parser, 1
    assert_hes_values parser, 0, 'exists' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_no_hes_records
    parser = Canql::Parser.new('all cases with no hes records')
    assert parser.valid?
    assert_hes_count parser, 1
    assert_hes_values parser, 0, 'exists' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_hes_events
    parser = Canql::Parser.new('all patients with no hes events')
    assert parser.valid?
    assert_hes_count parser, 1
    assert_hes_values parser, 0, 'exists' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_hes_records
    parser = Canql::Parser.new('all patients with no hes records')
    assert parser.valid?
    assert_hes_count parser, 1
    assert_hes_values parser, 0, 'exists' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end
end
