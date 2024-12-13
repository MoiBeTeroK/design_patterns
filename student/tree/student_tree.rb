class TreeNode
  attr_accessor :parent, :left, :right, :value
  def initialize(parent:nil, left:nil, right:nil, value:nil)
    @parent = parent
    @left = left
    @right = right
    @value = value
  end
end

class StudentTree
  include Enumerable

  def initialize(root = nil)
    @root = root ? TreeNode.new(value: root) : nil
  end

  def each(&block)
    node_processing(@root, &block)
  end

  def add(value)
    @root = recursive_addition(@root, value)
  end

  private

  def recursive_addition(node, value)
    return TreeNode.new(value: value) if node.nil?

    if value < node.value
      node.left = recursive_addition(node.left, value)
      node.left.parent = node if node.left
    else
      node.right = recursive_addition(node.right, value)
      node.right.parent = node if node.right
    end

    node
  end

  def node_processing(node, &block)
    return if node.nil?
    node_processing(node.left, &block)
    block.call(node.value)
    node_processing(node.right, &block)
  end
end