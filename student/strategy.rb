class Strategy

  def read(file_path)
      raise NotImplementedError, 'It is necessary to implement'
  end

  def write(file_path, students)
      raise NotImplementedError, 'It is necessary to implement'
  end
end