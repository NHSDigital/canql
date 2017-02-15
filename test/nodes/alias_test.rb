# frozen_string_literal: true
require "test_helper"

class AliasTest < Minitest::Test
  def test_dob_alias
    assert(Canql::Parser.new("all babies with missing date of birth").valid?,
      "That's a reference test for 'dob' alias,\
      if this fails, something is wrong!!!")

    assert(Canql::Parser.new("all babies with missing dob").valid?,
      "'dob' should be a valid alias for 'date of birth'!")

    assert_equal(Canql::Parser.new("all babies with missing postcode, \
                                                 date of birth").meta_data,
      Canql::Parser.new("all babies with missing postcode, dob").meta_data,
      "'dob' doesn't work as an alias of 'date of birth'!")

    assert(Canql::Parser.new("all babies with missing postcode, pac").meta_data \
      != \
      Canql::Parser.new("all babies with missing postcode, \
                                                      date of birth").meta_data,
      "'pac' appears to be working in the same way as 'dob' does,\
       and 'pac' wasn't included in the grammar config!")

    assert_equal(Canql::Parser.new("first 27 male liveborn thames cases \
      expected between 20/06/2015 and 25/06/2015 \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing postcode and date of birth \
      and wait action and unprocessed paediatric records \
      and mother born between 01/10/1990 and 10/01/1999 \
      and who died on 01/01/2016 \
      with fields postcode and nhs number").meta_data,
      Canql::Parser.new("first 27 male liveborn thames cases \
      expected between 20/06/2015 and 25/06/2015 \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing postcode and dob \
      and wait action and unprocessed paediatric records \
      and mother born between 01/10/1990 and 10/01/1999 \
      and who died on 01/01/2016 \
      with fields postcode and nhs number").meta_data,
      "'dob' doesn't work as an alias of 'date of birth'\
        in a complicated query!")
  end
end
