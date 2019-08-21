class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end

  def add(key, val)
    if key <= @key
      if left.nil?
        @left = TreeNode.new(key, val)
      else
        @left.add(key, val)
      end
    else
      if right.nil?
        @right = TreeNode.new(key, val)
      else
        @right.add(key, val)
      end
    end
  end

   def find(key)
    if key == @key
      return @value
    elsif key <= @key
      return nil if @left.nil?
      return @left.find(key)
    else
      return nil if @right.nil?
      return @right.find(key)
    end
   end

   def inorder(array)
     left.inorder(array) unless left.nil? 
     array << { key: @key, value: @value }
     right.inorder(array) unless right.nil?
   end

   def preorder(array)
    array << { key: @key, value: @value }
    left.preorder(array) unless left.nil?
    right.preorder(array) unless right.nil?
   end

  def postorder(array)
    left.postorder(array) unless left.nil?
    right.postorder(array) unless right.nil?
    array << { key: @key, value: @value }
  end

  def bfs(list)
    queue = [self]

    return bfs_helper(queue, list)
  end

  private 

    def bfs_helper(queue, list)
      return list if queue.size == 0
      first_item = queue.shift
      list << { key: first_item.key, value: first_item.value }
      queue << first_item.left unless first_item.left.nil?
      queue << first_item.right unless first_item.right.nil?

      return bfs_helper(queue, list)

    end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  def add(key, value)
    if @root == nil
      @root = TreeNode.new(key, value)
    else
      @root.add(key, value)
    end
  end

  def find(key)
    return nil if @root.nil?
    return @root.find(key)
  end

  def inorder
    list = []
    @root.inorder(list) unless @root.nil?
    return list
  end

  def preorder
    list = []
    @root.preorder(list) unless @root.nil?
    return list
  end

  def postorder
    list = []
    @root.postorder(list) unless @root.nil?
    return list
  end

  def bfs
    list = []
    return @root.bfs(list) unless @root.nil?
    return list
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end

