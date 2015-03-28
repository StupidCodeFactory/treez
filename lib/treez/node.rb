module Treez
  class Node
    attr_reader :data, :left, :right, :parent

    def initialize(data, parent = nil)
      self.data   = data
      self.parent = parent
    end

    def add(new_data)
      return self if data == new_data

      if new_data <= data
        insert(:left, new_data)
      else
        insert(:right, new_data)
      end
    end

    def to_s
      inspect
    end

    private
    attr_writer :data, :left, :right, :parent

    def insert(direction, new_data)
      if direction == :left
        if left.nil?
          self.left = Node.new(new_data, self)
        else
          self.left.add new_data
        end
      else
        if right.nil?
          self.right = Node.new(new_data, self)
        else
          self.right.add new_data
        end
      end
    end
  end
end
