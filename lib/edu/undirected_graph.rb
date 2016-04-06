module Edu
  class UndirectedGraph
    def initialize
      @adjacency_list = {}
    end

    def dfs
      unless @dfs
        @clock = 0
        @dfs = []
        @adjacency_list.keys.sort.each { |k| explore(k) }
      end
      @dfs
    end

    def add_edge(v1, v2)
      pair = [v1, v2].sort
      @adjacency_list[pair.first] ||= SortedSet.new
      @adjacency_list[pair.last] ||= SortedSet.new
      @adjacency_list[pair.first].add(pair.last)
      @dfs = nil
    end

    def each_vertex
      @adjacency_list.keys.sort.each
    end

    def each_adjacent(vertex)
      return to_enum(:each_adjacent, vertex) unless block_given?
      @adjacency_list.select { |k, v| k < vertex && v.include?(vertex) }.sort_by(&:first).each do |k, v|
        yield k
      end
      @adjacency_list[vertex].each { |v| yield v }
    end

    private

    def explore(vertex)
      if unexplored?(vertex)
        info = { vertex: vertex, pre: @clock += 1 }
        @dfs << info

        each_adjacent(vertex) { |adj| explore(adj) }

        info[:post] = @clock += 1
      end
    end

    def unexplored?(vertex)
      @dfs.each do |step|
        return false if step[:vertex] == vertex
      end
      true
    end
  end
end
