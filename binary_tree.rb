require_relative 'node.rb'

class BinaryTree

  def insert_recursive(current, key, value, parent)
    if current == nil
      return Node.new(key, value, parent)
    end
    if key < current.key
      current.left = insert_recursive(current.left, key, value, current)
    elsif key > current.key
      current.right = insert_recursive(current.right, key, value, current)
    else
      current
    end
    current
  end

  def insert(key, value)
    @root = insert_recursive(@root, key, value, nil)
  end

  def delete key
    delete_recursive(@root, key)
  end

  def delete_recursive(current, key)
    if current.key > key
      delete_recursive(current.left, key)
    elsif current.key < key
      delete_recursive(current.right, key)
    else
      if current.parent.left.equal? current
        current.parent.left = nil
      else
        current.parent.right = nil
      end
    end
    current
  end

  def navigate
    current = @root
    step = nil

    while step != 0
      puts "Press 1 - left, 2 - right, 3 - up, 0 - exit"
      step = gets.chomp.to_i
      case step
      when 1
        if current.left != nil
          #puts current.left.key.to_s
          print_parent(@root, current.left.key)
          current = current.left
        else
          puts 'nil'
        end
      when 2
        if current.right != nil
          #puts current.right.key.to_s
          print_parent(@root, current.right.key)
          current = current.right
        else
          puts 'nil'
        end
      when 3
        if current.parent != nil
          #puts current.parent.key.to_s
          print_parent(@root, current.parent.key)
          current = current.parent
        else
          puts 'nil'
        end
      end
    end
  end

  def print_parent(current_node, key)
    print current_node.key.to_s + " -> "
    if current_node.key != key
      if current_node.key < key
        print_parent(current_node.right, key)
      else
        print_parent(current_node.left, key)
      end
    end
    puts
  end

  def start
    task_number = nil
    while task_number != 0
      puts "1 - insert element, 2 - delete element, 3 - navigate, 0 - exit"
      task_number = gets.chomp.to_i
      if task_number >= 1 && task_number <= 3
        case task_number
        when 1
          puts "Write element"
          puts "Write key"
          key = gets.chomp.to_i
          puts "Write value"
          value = gets.chomp.to_s
          @root = insert_recursive(@root, key, value,nil)
        when 2
          puts "Write key of node"
          delete_recursive(@root, gets.chomp.to_i)
        when 3
          navigate
        end
      end
    end
  end
end


tree = BinaryTree.new
tree.insert(5, "value1")
tree.insert(5, "value2")
tree.insert(3, "value3")
tree.insert(1, "value4")
tree.insert(6, "value5")
tree.insert(6, "value12")
tree.insert(2, "value6")
tree.insert(10, "value7")
tree.insert(8, "value8")
tree.insert(13, "value9")
tree.insert(4, "value10")
tree.insert(9, "value11")

tree.start

