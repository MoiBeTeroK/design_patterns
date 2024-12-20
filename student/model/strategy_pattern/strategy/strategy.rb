class Strategy

  def read_from_file(file_path)
      raise NotImplementedError, 'It is necessary to implement'
  end

  def write_to_file(file_path, students)
      raise NotImplementedError, 'It is necessary to implement'
  end
end