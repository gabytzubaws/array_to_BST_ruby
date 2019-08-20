class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class BinaryTree
  def initialize(root = nil)
    @root = root
  end
  def build_tree(array)
    @root = insert(nil, array.shift)
    array.each do |value|
      insert(@root, value)
    end
    @root
  end
  def insert(node, value)
    return Node.new(value) if node.nil?
    while true do
      if value < node.val
        if node.left
          node = node.left
        else
          node.left = Node.new(value)
          break
        end
      else if value > node.val
          if node.right
            node = node.right
          else
            node.right = Node.new(value)
            break
          end
        end
      end
    end
  end

  def breadth_first_search (target)
    q = []
    q << @root.left if @root.left
    q << @root.right if @root.right
    while !q.empty?
      current = q.shift
      return current if current.val == target
      q << current.right if current.right
      q << current.left if current.left
    end
  end

  def depth_first_search (target)
    s = []
    s << @root.left if @root.left
    s << @root.right if @root.right
    while !s.empty?
      current = s.pop
      return current if current.val == target
      s << current.left if current.left
      s << current.right if current.right
    end
  end
  def dfs_rec(target, current = @root)
    return current if current.val == target
    dfs_rec(target, current.left) if current.left
    dfs_rec(target, current.right) if current.right
  end

end
tree = BinaryTree.new()
tree.build_tree([50, 30, 20, 40, 70, 60, 80])
p tree.breadth_first_search(40)
p tree.depth_first_search(40)
p tree.dfs_rec(40)
