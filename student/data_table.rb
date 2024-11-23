class DataTable
  def initialize(data)
    @data = data
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
end