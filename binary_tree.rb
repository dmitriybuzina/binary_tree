require_relative 'node.rb'

# class Binary tree
class BinaryTree
  def insert_recursive(current, key, value, parent)
    return Node.new(key, value, parent) if current.nil?

    if key < current.key
      current.left = insert_recursive(current.left, key, value, current)
    elsif key > current.key
      current.right = insert_recursive(current.right, key, value, current)
    end
    current
  end

  def insert(key, value)
    @root = insert_recursive(@root, key, value, nil)
  end

  def delete(key)
    delete_recursive(@root, key)
  end

  def delete_recursive(current, key)
    return delete_recursive(current.left, key) if current.key > key
    return delete_recursive(current.right, key) if current.key < key
    return current.parent.left = nil if current.parent.left.equal? current
    current.parent.right = nil
  end

  def help_navigate(current)
    current.nil? ? (print 'no element') : print_parent(@root, current.key)
    current
  end

  def navigate
    current = @root
    step = nil
    while step != 0
      puts "\nPress 1 - left, 2 - right, 3 - up, 0 - exit"
      step = gets.chomp.to_i
      case step
      when 1
        current = help_navigate(current.left)
      when 2
        current = help_navigate(current.right)
      when 3
        current = help_navigate(current.parent)
      end
    end
  end

  def print_parent(current_node, key)
    print current_node.key.to_s + ' -> '
    print_parent(current_node.right, key) if current_node.key < key
    print_parent(current_node.left, key) if current_node.key > key
  end

  def random_insert
    r = Random.new
    10.times do
      random_int = r.rand(1...20)
      @root = insert_recursive(@root, random_int, "value #{random_int}", nil)
    end
  end

  def write_insert
    loop do
      puts 'Write key:'
      key = gets.chomp.to_i
      puts 'Write value:'
      value = gets.chomp.to_s
      @root = insert_recursive(@root, key, value, nil)
      puts '1 - new element, 0 - exit'
      break if gets.chomp.to_i.zero?
    end
  end

  def write_delete
    loop do
      puts 'Write key of node:'
      delete_recursive(@root, gets.chomp.to_i)
      puts '1 - delete element, 0 - exit'
      task_second = gets.chomp.to_i
      break if task_second.zero?
    end
  end

  def start
    task_number = nil
    while task_number != 0
      puts '1 - insert element, 2 - delete element, 3 - navigate, 0 - exit'
      task_number = gets.chomp.to_i
      case task_number
      when 1
        write_insert
      when 2
        write_delete
      when 3
        navigate
      end
    end
  end
end

tree = BinaryTree.new
tree.start
