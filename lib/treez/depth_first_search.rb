module Treez
  class DepthFirstSearch
    def initialize(root)
      self.root = root
    end

    def perform(node = nil, &block)
      node ||= root

      if block_given?
        return if yield(node)
      end

      if !node.left.nil?
        perform(node.left, &block)
      end

      if !node.right.nil?
        perform(node.right, &block)
      end
    end

    private
    attr_accessor :root
  end
end
