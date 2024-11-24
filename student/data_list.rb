class DataList
  def initialize(data)
    @data = data.freeze
    @selected = []
  end

  def select(number)
    @selected << number unless @selected.include?(number)
  end

  def get_selected
    @selected.dup
  end

  def get_names
    raise ArgumentError, "The method get_names is not implemented"
  end

  def get_data
    raise ArgumentError, "The method get_data is not implemented"
  end

  protected

  attr_reader :data
  attr_accessor :selected

  def data=(data)
    @data = data.map { |row| deep_copy(row) }
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