class TreeNode
  attr_accessor :student, :left, :right
  def initialize(student)
    @student = student
    @left = nil
    @right = nil
  end
end

class StudentTree
  include Enumerable

  def initialize
    @root = nil
  end

  def each(&block)
    node_processing(@root, &block)
  end

  def add(student)
    @root = recursive_addition(@root, student)
  end

  private

  def recursive_addition(node, student)
    return TreeNode.new(student) if node.nil?
    if !student.birth_date.nil? && student.birth_date < node.student.birth_date
      node.left = recursive_addition(node.left, student)
    else
      node.right = recursive_addition(node.right, student)
    end
    node
  end

  def node_processing(node, &block)
    return if node.nil?
    node_processing(node.left, &block)
    yield node.student
    node_processing(node.right, &block)
  end
end