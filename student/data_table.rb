class DataTable
  def initialize(data)
    @data = data
  end

  def row_count
    @data.size
  end

  def column_count
    @data.empty? ? 0 : @data.first.size
  end

  def get_element(row, column)
    raise IndexError, "Incorrect index" unless validate_indices?(row, column)
    deep_copy(@data[row][column])
  end

  private

  attr_reader :data

  def data=(data)
    raise ArgumentError, "Incorrect data" unless valid_data?(data)
    @data = data.map { |row| row.dup }
  end

  def valid_data?(data)
    data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
  end

  def validate_indices?(row, column)
    row.between?(0, row_count - 1) && column.between?(0, column_count - 1)
  end

  def deep_copy(obj)
    if obj.is_a?(Array)
      obj.map { |item| deep_copy(item) }
    elsif obj.is_a?(Hash)
      obj.transform_values { |value| deep_dup(value) }
    elsif obj.respond_to?(:dup)
      obj.dup
    else
      obj
    end
  end
end