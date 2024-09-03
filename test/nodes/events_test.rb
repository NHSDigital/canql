# frozen_string_literal: true

require 'test_helper'
require 'events_test_helper'

# case / patient hes tests
class EventsTest < Minitest::Test
  include EventsTestHelper

  def test_should_filter_cases_by_hes_events
    parser = Canql::Parser.new('all cases with some hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['hes_event']  , 0, {'hes_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_hes_records
    parser = Canql::Parser.new('all cases with some hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['hes_event']  , 0, {'hes_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_hes_events
    parser = Canql::Parser.new('all patients with hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['hes_event']  , 0, {'hes_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_hes_records
    parser = Canql::Parser.new('all patients with hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['hes_event']  , 0, {'hes_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_no_hes_events
    parser = Canql::Parser.new('all cases with no hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['hes_event']  , 0, {'hes_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_no_hes_records
    parser = Canql::Parser.new('all cases with no hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['hes_event']  , 0, {'hes_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_hes_events
    parser = Canql::Parser.new('all patients with no hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['hes_event']  , 0, {'hes_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_hes_records
    parser = Canql::Parser.new('all patients with no hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['hes_event']  , 0, {'hes_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_birth_events
    parser = Canql::Parser.new('all cases with some birth events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['birth_event']  , 0, {'birth_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_birth_records
    parser = Canql::Parser.new('all cases with some birth records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['birth_event']  , 0, {'birth_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_birth_events
    parser = Canql::Parser.new('all patients with no birth events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['birth_event']  , 0, {'birth_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_birth_records
    parser = Canql::Parser.new('all patients with no birth records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['birth_event']  , 0, {'birth_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_death_events
    parser = Canql::Parser.new('all cases with some death events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['death_event']  , 0, {'death_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_death_records
    parser = Canql::Parser.new('all cases with some death records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['death_event']  , 0, {'death_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_death_events
    parser = Canql::Parser.new('all patients with no death events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['death_event']  , 0, {'death_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_death_records
    parser = Canql::Parser.new('all patients with no death records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['death_event']  , 0, {'death_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_preg_loss_hes_events
    parser = Canql::Parser.new('all cases with some pregnancy loss hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['pregnancy_loss_hes_event']  , 0, {'pregnancy_loss_hes_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_preg_loss_hes_records
    parser = Canql::Parser.new('all cases with some preg loss hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['pregnancy_loss_hes_event']  , 0, {'pregnancy_loss_hes_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_preg_loss_hes_events
    parser = Canql::Parser.new('all patients with no preg loss hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['pregnancy_loss_hes_event']  , 0, {'pregnancy_loss_hes_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_preg_loss_hes_records
    parser = Canql::Parser.new('all patients with no pregnancy loss hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['pregnancy_loss_hes_event']  , 0, {'pregnancy_loss_hes_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_preg_loss_bpas_events
    parser = Canql::Parser.new('all cases with some pregnancy loss bpas events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['pregnancy_loss_bpas_event']  , 0, {'pregnancy_loss_bpas_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_preg_loss_bpas_records
    parser = Canql::Parser.new('all cases with some preg loss bpas records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['pregnancy_loss_bpas_event']  , 0, {'pregnancy_loss_bpas_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_preg_loss_bpas_events
    parser = Canql::Parser.new('all patients with no preg loss bpas events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['pregnancy_loss_bpas_event']  , 0, {'pregnancy_loss_bpas_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_preg_loss_bpas_records
    parser = Canql::Parser.new('all patients with no pregnancy loss bpas records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['pregnancy_loss_bpas_event']  , 0, {'pregnancy_loss_bpas_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_msds_events
    parser = Canql::Parser.new('all cases with some msds events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['msds_event']  , 0, {'msds_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_msds_records
    parser = Canql::Parser.new('all cases with some msds records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['msds_event']  , 0, {'msds_event' => {'equals' => true}}
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_msds_events
    parser = Canql::Parser.new('all patients with no msds events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['msds_event']  , 0, {'msds_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_msds_records
    parser = Canql::Parser.new('all patients with no msds records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values parser, 'events', ['msds_event']  , 0, {'msds_event' => {'equals' => false}}
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end
end
