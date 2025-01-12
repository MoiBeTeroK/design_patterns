module Deep_dup
  def deep_copy(obj)
    if obj.is_a?(Array)
      obj.map { |item| deep_copy(item) }
    elsif obj.is_a?(Hash)
      obj.transform_values { |value| deep_copy(value) }
    elsif obj.respond_to?(:dup)
      obj.dup
    else
      obj
    end
  end
end