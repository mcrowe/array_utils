require './test/support/test_helper'

class TestArrayUtils < MiniTest::Unit::TestCase

  include ArrayUtils

  def test_build_2d
    assert_equal [[0, 0, 0], [0, 0, 0]], build_2d(3, 2)
    assert_equal [[1, 1], [1, 1]], build_2d(2, 2, 1)

    # Ensure rows are independent objects.

    a = build_2d(2, 2, 0)

    a[0][0] = 1
    assert_equal [[1, 0], [0, 0]], a
  end

  def test_truncate
    assert_equal [0, 1, 2, 3, 0], truncate([-1, 1, 2, 3, -5.3])
  end

  def test_sum
    assert_equal 4, sum([0, 1, 3])
  end

  def test_unitize
    assert_equal [0, 0, 1], unitize([0, 0, 1])
    assert_equal [0, 1, 0], unitize([0, 2, 0])
    assert_equal [0.5, 0.5], unitize([0, 0])
  end

  def test_inner_product
    assert_equal 0, inner_product([0, 1, 0], [1, 0, 0])
    assert_equal 1, inner_product([0, 1, 0], [0, 1, 0])
  end

  def test_scalar_diff
    assert_equal [-1, 0, 1], scalar_diff([0, 1, 2], 1)
  end

  def test_sample_index_by_value
    assert_equal 2, sample_index_by_value([0, 0, 1])
    assert_equal 1, sample_index_by_value([0, 3.2, 0])
  end

  def test_array_add
    assert_equal [1, 1, 0], array_add([0, 1, 0], [1, 0, 0])
  end

  def test_array_add!
    original = [0, 1, 0]

    result = array_add!([1, 0, 0], original)

    assert_equal [1, 1, 0], result
    assert_equal [1, 1, 0], original
  end

  def test_scalar_product
    assert_equal [2, 4, 6], scalar_product([1, 2, 3], 2)
  end

  def test_to_i
    assert_equal [0, 10, 15], to_i([0.6, 10.2, 15.4])
  end

end