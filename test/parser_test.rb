# frozen_string_literal: true

require 'test_helper'

class ParserTest < Minitest::Test
  def test_canql_parser
    query = 'first 27 norcas male cases'
    parser = CanqlParser.new
    parser.parse(query.downcase)
  end

  def test_should_raise_exception_on_non_string_query
    assert_raises ArgumentError do
      Canql::Parser.new(/all cases/)
    end
  end

  def test_should_display_error_msg_on_empty_query
    parser = Canql::Parser.new('')
    refute parser.valid?
    assert_instance_of Hash, parser.meta_data
    assert parser.meta_data.empty?
    refute_nil parser.failure_reason
  end

  def test_should_display_error_msg_on_invalid_query
    parser = Canql::Parser.new('bob and simon')
    refute parser.valid?
    assert parser.meta_data.empty?
    refute_nil parser.failure_reason
  end

  def test_should_cope_with_a_mixed_case_query
    parser = Canql::Parser.new('All Cases')
    assert parser.valid?
    assert_equal 1, parser.meta_data.count
    assert_equal base_meta_data, parser.meta_data
    assert_nil parser.failure_reason
  end

  # advanced tests

  def test_should_combine_filters
    # TODO: Add unprocessed record clauses
    parser = Canql::Parser.new("first 27 male liveborn thames primary eurocat cases \
      expected between 20/06/2015 and 25/06/2015 \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with suspected prenatal q20 anomalies \
      and booking at hospital RGT01 \
      and delivery at addenbrookes trust \
      and postnatal tests and missing delivery postcode and date of birth \
      and qa action and unprocessed paediatric records \
      and hes records \
      and mother born between 01/10/1990 and 10/01/1999 \
      and who died on 01/01/2016 \
      with fields sex and nhs number")
    assert parser.valid?
    assert_equal 21, parser.meta_data.count
    individual_queries = [
      'first 27 cases',
      'first 27 babies',
      'all male cases',
      'all male babies',
      'all cases expected between 20/06/2015 and 25/06/2015',
      'all babies expected between 20/06/2015 and 25/06/2015',
      'all liveborn cases',
      'all liveborn babies',
      'all primary cases',
      'all primary babies',
      'all eurocat cases',
      'all eurocat babies',
      'all thames cases',
      'all thames babies',
      'all cases with suspected prenatal q20 anomalies',
      'all cases with postnatal tests',
      'all babies with suspected prenatal q20 anomalies',
      'all babies with postnatal tests',
      'all babies with some postnatal tests',
      'all babies with suspected prenatal q20 anomalies',
      'all cases with some postnatal tests',
      'all cases with suspected prenatal q20 anomalies',
      'all cases with missing delivery postcode and date of birth',
      'all cases with missing delivery postcode, date of birth',
      'all babies with missing delivery postcode and date of birth',
      'all babies with missing delivery postcode, date of birth',
      'all cases with mother with fields sex and nhs number',
      'all cases with mother with populated sex and nhs number',
      'all cases with qa action and unprocessed paediatric records',
      'all cases born on 22/06/2015',
      'all babies born on 22/06/2015',
      'all cases delivered on 22/06/2015',
      'all babies delivered on 22/06/2015',
      'all cases with mother born between 01/10/1990 and 10/01/1999',
      'all babies with mother born between 01/10/1990 and 10/01/1999',
      'all cases with mother that died on 01/01/2016',
      'all cases who died on 01/12/2015',
      'all cases with booking at hospital RGT01',
      'all case delivery at addenbrookes trust',
      'all cases with hes records',
      'all cases with hes events',
      'all babies with hes records',
      'all babies with hes events'
    ]
    assert_meta_data_includes(parser, individual_queries)
  end
end
