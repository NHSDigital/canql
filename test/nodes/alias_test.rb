# frozen_string_literal: true
require "test_helper"

class AliasTest < Minitest::Test
  def test_dob_alias
    query1 = "all babies with missing date of birth"
    parser = Canql::Parser.new(query1)
    message = "That's a reference test for 'dob' alias, if this fails,\
               something is wrong!!!"
    assert(parser.valid?, message)

    query1 = "all babies with missing dob"
    parser = Canql::Parser.new(query1)
    message = "'dob' should be a valid alias for 'date of birth'!"
    assert(parser.valid?, message)

    query1 = "all babies with missing postcode, date of birth"
    query2 = "all babies with missing postcode, dob"
    parser1 = Canql::Parser.new(query1)
    parser2 = Canql::Parser.new(query2)
    message = "'dob' doesn't work as an alias of 'date of birth'!"
    assert_equal(parser1.meta_data, parser2.meta_data, message)

    query1 = "all babies with missing postcode, date of birth"
    query2 = "all babies with missing postcode, pac"
    parser1 = Canql::Parser.new(query1)
    parser2 = Canql::Parser.new(query2)
    message = "'pac' appears to be working in the same way as 'dob' does,\
               and 'pac' wasn't included in the grammar config!"
    assert(parser1.meta_data != parser2.meta_data, message)

    query1 = "first 27 male liveborn thames cases \
      expected between 20/06/2015 and 25/06/2015 \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing postcode and date of birth \
      and wait action and unprocessed paediatric records \
      and mother born between 01/10/1990 and 10/01/1999 \
      and who died on 01/01/2016 \
      with fields postcode and nhs number")
    query2 = "first 27 male liveborn thames cases \
      expected between 20/06/2015 and 25/06/2015 \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing postcode and dob \
      and wait action and unprocessed paediatric records \
      and mother born between 01/10/1990 and 10/01/1999 \
      and who died on 01/01/2016 \
      with fields postcode and nhs number")
    parser1 = Canql::Parser.new(query1)
    parser2 = Canql::Parser.new(query2)
    message = "'dob' doesn't work as an alias of 'date of birth'\
      in a complicated query!"
    asser_equal(parser1.meta_data, parser2.meta_data, message)
  end
end
