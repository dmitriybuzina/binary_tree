class Node

  attr_accessor :value,
                :left,
                :right,
                :key,
                :parent

  def initialize(key, value, parent)
    @value = value
    @left = nil
    @right = nil
    @key = key
    @parent = parent
  end
end