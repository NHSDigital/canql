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
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_hes_records
    parser = Canql::Parser.new('all cases with some hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_hes_events
    parser = Canql::Parser.new('all patients with hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_hes_records
    parser = Canql::Parser.new('all patients with hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_no_hes_events
    parser = Canql::Parser.new('all cases with no hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_no_hes_records
    parser = Canql::Parser.new('all cases with no hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_hes_events
    parser = Canql::Parser.new('all patients with no hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_hes_records
    parser = Canql::Parser.new('all patients with no hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_birth_events
    parser = Canql::Parser.new('all cases with some birth events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'birth', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_birth_records
    parser = Canql::Parser.new('all cases with some birth records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'birth', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_birth_events
    parser = Canql::Parser.new('all patients with no birth events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'birth', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_birth_records
    parser = Canql::Parser.new('all patients with no birth records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'birth', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_death_events
    parser = Canql::Parser.new('all cases with some death events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'death', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_death_records
    parser = Canql::Parser.new('all cases with some death records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'death', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_death_events
    parser = Canql::Parser.new('all patients with no death events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'death', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_death_records
    parser = Canql::Parser.new('all patients with no death records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'death', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_preg_loss_hes_events
    parser = Canql::Parser.new('all cases with some pregnancy loss hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'pregnancy_loss_hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_preg_loss_hes_records
    parser = Canql::Parser.new('all cases with some preg loss hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'pregnancy_loss_hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_preg_loss_hes_events
    parser = Canql::Parser.new('all patients with no preg loss hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'pregnancy_loss_hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_preg_loss_hes_records
    parser = Canql::Parser.new('all patients with no pregnancy loss hes records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'pregnancy_loss_hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_preg_loss_bpas_events
    parser = Canql::Parser.new('all cases with some pregnancy loss bpas events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'pregnancy_loss_bpas', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_preg_loss_bpas_records
    parser = Canql::Parser.new('all cases with some preg loss bpas records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'pregnancy_loss_bpas', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_preg_loss_bpas_events
    parser = Canql::Parser.new('all patients with no preg loss bpas events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'pregnancy_loss_bpas', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_preg_loss_bpas_records
    parser = Canql::Parser.new('all patients with no pregnancy loss bpas records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'pregnancy_loss_bpas', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_msds_events
    parser = Canql::Parser.new('all cases with some msds events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'msds', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_msds_records
    parser = Canql::Parser.new('all cases with some msds records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'msds', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patient_by_no_msds_events
    parser = Canql::Parser.new('all patients with no msds events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'msds', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_patients_by_no_msds_records
    parser = Canql::Parser.new('all patients with no msds records')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => false, 'type' => 'msds', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_invalid_with_linked_on_hes_events
    parser = Canql::Parser.new('all cases with some linked hes events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no linked hes events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with some related hes events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no related hes events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with some relevant hes events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no relevant hes events')
    refute parser.valid?
  end

  def test_invalid_with_linked_on_birth_events
    parser = Canql::Parser.new('all cases with some linked birth events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no linked birth events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with some related birth events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no related birth events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with some relevant birth events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no relevant birth events')
    refute parser.valid?
  end

  def test_invalid_with_linked_on_death_events
    parser = Canql::Parser.new('all cases with some linked death events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no linked death events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with some related death events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no related death events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with some relevant death events')
    refute parser.valid?
    parser = Canql::Parser.new('all cases with no relevant death events')
    refute parser.valid?
  end

  def test_valid_with_linked_on_preg_loss_hes_events
    parser = Canql::Parser.new('all cases with some linked pregnancy loss hes events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no linked pregnancy loss hes events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with some related pregnancy loss hes events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no related pregnancy loss hes events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with some relevant pregnancy loss hes events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no relevant pregnancy loss hes events')
    assert parser.valid?
  end

  def test_valid_with_linked_on_preg_loss_bpas_events
    parser = Canql::Parser.new('all cases with some linked pregnancy loss bpas events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no linked pregnancy loss bpas events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with some related pregnancy loss bpas events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no related pregnancy loss bpas events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with some relevant pregnancy loss bpas events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no relevant pregnancy loss bpas events')
    assert parser.valid?
  end

  def test_valid_with_linked_on_msds_events
    parser = Canql::Parser.new('all cases with some linked msds events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no linked msds events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with some related msds events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no related msds events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with some relevant msds events')
    assert parser.valid?
    parser = Canql::Parser.new('all cases with no relevant msds events')
    assert parser.valid?
  end

  def test_should_filter_cases_by_some_linked_preg_loss_hes_events
    parser = Canql::Parser.new('all cases with some linked pregnancy loss hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'pregnancy_loss_hes', 'relevant' => true }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_linked_preg_loss_bpas_events
    parser = Canql::Parser.new('all cases with some related preg loss bpas events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'pregnancy_loss_bpas', 'relevant' => true }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_linked_msds_events
    parser = Canql::Parser.new('all cases with some relevant msds events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'msds', 'relevant' => true }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_ublinked_preg_loss_hes_events
    parser = Canql::Parser.new('all cases with some unlinked pregnancy loss hes events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'pregnancy_loss_hes', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_unlinked_preg_loss_bpas_events
    parser = Canql::Parser.new('all cases with some unrelated preg loss bpas events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'pregnancy_loss_bpas', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_cases_by_some_unlinked_msds_events
    parser = Canql::Parser.new('all cases with some irrelevant msds events')
    assert parser.valid?
    assert_dir_block_count parser, 'events', 1
    assert_dir_block_values(
      parser, 'events',
      %w[equals type relevant], 0,
      { 'equals' => true, 'type' => 'msds', 'relevant' => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end
end
