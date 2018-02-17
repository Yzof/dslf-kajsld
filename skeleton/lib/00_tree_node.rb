require "byebug"
class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent)
    @parent.children.delete(self) if @parent
    @parent = parent
    if parent != nil && !@parent.children.include?(self)
      @parent.children << self
    end
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "error" if !@children.include?(child)
    @children.delete(child)
    child.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      child_node = child.dfs(target_value)
      #debugger
      if child_node
        return child_node
      end
    end

    nil
  end

  def bfs(target_value)
    queue = []
    queue << self
    #debugger
    until queue.empty?
      current_node = queue.shift
      if current_node.value == target_value
        return current_node
      else
        queue += current_node.children
      end
    end

  end

  def inspect
    self.value
  end

end
