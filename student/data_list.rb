require './deep_copy.rb'
require './data_table.rb'

class DataList
  include Deep_dup

  def initialize(data)
    @data = data.freeze
    @selected = []
  end

  def select(number)
    element = data[number]
    @selected << element unless @selected.include?(element)
  end

  def get_selected
    deep_copy(@selected)
  end

  def get_names
    raise ArgumentError, "The method get_names is not implemented"
  end

  def data_row(index)
    raise ArgumentError, "The method data_row is not implemented"
  end

  def get_data
    data_for_table = @data.map.with_index do |student, index|
      self.data_row(index)
    end
    DataTable.new(data_for_table)
  end

  protected

  attr_reader :data
  attr_accessor :selected

  def data=(data)
    @data = data.map { |row| deep_copy(row) }
  end
end
