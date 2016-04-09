module Edu
  class UndirectedGraph
    def initialize
      @adjacency_list = {}
    end

    def add_edge(v1, v2)
      pair = [v1, v2].sort
      @adjacency_list[pair.first] ||= SortedSet.new
      @adjacency_list[pair.last] ||= SortedSet.new
      @adjacency_list[pair.first].add(pair.last)
      @dfs = nil
    end

    def each_vertex
      vertices = @adjacency_list.keys.sort.each
      return vertices unless block_given?
      vertices.each { |vertex| yield vertex }
    end

    def each_adjacent(vertex)
      return to_enum(:each_adjacent, vertex) unless block_given?
      @adjacency_list.select { |k, v| k < vertex && v.include?(vertex) }.sort_by(&:first).each do |k, v|
        yield k
      end
      @adjacency_list[vertex].each { |v| yield v }
    end
  end
end
