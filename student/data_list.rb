class DataList
  def initialize(data)
    @data = data.sort.freeze
  end

  private
  
  attr_reader :data

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