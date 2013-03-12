require "array_utils/version"

module ArrayUtils

  extend self

  def build_2d(nx, ny, value = 0)
    array = []
    ny.times do
      row = []
      nx.times do
        row << value
      end
      array << row
    end

    array
  end

  def truncate(array)
    array.map { |i| i > 0 ? i : 0 }
  end

  def unitize(array)
    if array.any? { |v| v != 0 }
      s = sum(array).to_f
      array.map { |i| i / s }
    else
      [1.0 / array.size] * array.size
    end
  end

  def inner_product(array1, array2)
    (0...array1.size).map { |i| array1[i] * array2[i] }.inject(:+)
  end

  def scalar_diff(array, scalar)
    array.map { |e| e - scalar}
  end

  def sample_cdf(cdf_array)
    r = rand
    (0...cdf_array.size).find { |i| r < cdf_array[i] }
  end

  def sample_index_by_value(array)
    u = unitize(array)

    # Compute cumulative weight.
    s = 0
    cumulative_weights = u.map { |p| s += p }

    sample_cdf(cumulative_weights)
  end

  def sum(array)
    array.inject(:+)
  end

  def array_add!(array1, array2)
    array1.each_with_index do |x, i|
      array2[i] += x
    end

    array2
  end

  def array_add(array1, array2)
    array_add!(array1, array2.clone)
  end

  def scalar_product(array, scalar)
    array.map { |e| e * scalar }
  end

  def to_i(array)
    array.map { |e| e.to_i }
  end


end
