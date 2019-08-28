class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    new_node =  TreeNode.new(key, value)
    if !@root
      @root = new_node
    elsif @root.key > new_node.key
      @root.left = new_node
    else
      @root.right = new_node
    end
    return
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    current_node = @root
    while current_node
      if current_node.key == key
        return current_node.value
      elsif key < current_node.key
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end
    return nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    raise NotImplementedError
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
