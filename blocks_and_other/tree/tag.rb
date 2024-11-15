class Tag
  attr_accessor :name, :attributes, :children

  def initialize(name:, attributes: {}, children: [])
    @name = name
    @attributes = attributes
    @children = children
  end

  def opening_tag
    attrs = @attributes.map { |key, value| %(#{key}="#{value}") }.join(" ")
    "<#{name}#{attrs.empty? ? '' : ' ' + attrs}>"
  end

  def add_child(child)
    @children << child
  end

  def tag_count
    count = 1
    @children.each do |child|
      count += child.tag_count
    end
    count
  end

  def has_attributes?
    !@attributes.empty?
  end

  def self.parsing_attr(attr_str)
    attr_str.scan(/([a-zA-Z]+)="([^" >]*)"/).to_h
  end
end