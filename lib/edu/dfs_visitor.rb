module Edu
  class DFSVisitor
    def initialize(graph)
      @graph = graph
    end

    def previsit(&block)
      @previsit = block
    end

    def postvisit(&block)
      @postvisit = block
    end

    def run
      @tree = []
      @graph.each_vertex { |vertex| visit(vertex) }
    end

    private

    def visit(vertex)
      unless @tree.include?(vertex)
        @previsit.call(vertex)
        @tree << vertex
        @graph.each_adjacent(vertex) { |adj| visit(adj) }
        @postvisit.call(vertex)
      end
    end
  end
end
