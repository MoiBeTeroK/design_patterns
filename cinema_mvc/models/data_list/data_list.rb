require_relative '../deep_copy/deep_copy.rb'
require_relative '../data_table/data_table.rb'

class DataList
  include Deep_dup

  def initialize(data)
    @data = data.freeze
    @selected = []
    @observers = []
    @count = 0
  end

  def select(number)
    element = data[number]
    @selected << element unless @selected.include?(element)
  end

  def get_selected
    deep_copy(@selected)
  end

  def get_names
    column_names = ['№']
      base_names.each do |name| 
          column_names << name
      end
    column_names
  end

  def get_data
    data_for_table = [get_names]
    data.each_with_index do |item, index|
      data_for_table << data_row(item, index)
    end
    DataTable.new(data_for_table)
  end

  def notify
    return if observers.nil?
    observers.each do |observer|
      observer.set_table_params(self.get_names, self.count)
      observer.set_table_data(self.get_data)
    end
  end

  def add_observer(observer)
      @observers << observer
  end

  def data=(data)
    @data = data.map { |row| deep_copy(row) }
  end

  attr_accessor :count

  private

  attr_reader :data
  attr_accessor :selected, :observers

  def base_names
    raise NotImplementedError, "The method base_names is not implemented"
  end 

  def data_row(item, index)
    raise ArgumentError, "The method data_row is not implemented"
  end

end