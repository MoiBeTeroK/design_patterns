require "./tag"
require "./enumeration"

class HTMLTree
  attr_reader :root

  def initialize(html)
    @root = Tag.new(name: "root")
    build_tree(html)
  end

  def build_tree(html)
    stack = [@root]
    html.scan(/<(\/?)(\w+)([^>]*)>/).each do |slash, tag_name, attrs|
      attributes = Tag.parsing_attr(attrs)
      if slash.empty?
        tag = Tag.new(name: tag_name, attributes: attributes)
        stack.last.add_child(tag) if stack.last
        stack.push(tag)
      elsif stack.last.name == tag_name
        stack.pop
      end
    end
  end

  # обход в глубину
  def dfs_iterator
    DFS.new(@root)
  end

  # обход в ширину
  def bfs_iterator
    BFS.new(@root)
  end

  def tags_count
    @root.tag_count - 1
  end

  def has_attributes?(tag_name)
    tag = find_tag_by_name(@root, tag_name)
    tag ? tag.has_attributes? : false
  end

  private

  def find_tag_by_name(current_tag, tag_name)
    return current_tag if current_tag.name == tag_name
    current_tag.children.each do |child|
      found = find_tag_by_name(child, tag_name)
      return found if found
    end
    nil
  end

end

html_code = '<html>
<head>
    <title>Sample HTML</title>
</head>
<body>
    <div>
        <h1>Добро пожаловать на страницу</h1>
        <p>Внизу список</p>
        <ul>
            <li>1 запись</li>
            <li><a href="#">2 запись</a></li>
            <li>3 запись</li>
        </ul>
    </div>
    <div>
        <p>Вы все просмотрели</p>
    </div>
</body>
</html>'

tree = HTMLTree.new(html_code)

puts "Обход в глубину:"
tree.dfs_iterator.each { |tag| puts tag.opening_tag }

puts "\nОбход в ширину:"
tree.bfs_iterator.each { |tag| puts tag.opening_tag }