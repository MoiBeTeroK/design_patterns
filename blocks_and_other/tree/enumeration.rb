class TreeIterator
  include Enumerable

  attr_reader :root

  def initialize(root)
    @root = root
  end

  def each(&block)
    enumerator.each(&block)
  end

  protected

  attr_writer :root

  def enumerator
    raise NotImplementedError, 'Must implement enumerator in subclasses'
  end
end

class DFS < TreeIterator
  def enumerator
    Enumerator.new do |yielder|
      stack = [root]
      until stack.empty?
        current = stack.pop
        yielder << current unless current.name == "root"
        stack.concat(current.children.reverse) unless current.children.empty?
      end
    end
  end
end

class BFS < TreeIterator
  def enumerator
    Enumerator.new do |yielder|
      queue = [root]
      until queue.empty?
        current = queue.shift
        yielder << current unless current.name == "root"
        queue.concat(current.children) unless current.children.empty?
      end
    end
  end
end