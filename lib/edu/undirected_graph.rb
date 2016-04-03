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
      Enumerator.new do |yielder|
        @adjacency_list.select { |k, v| k < vertex && v.include?(vertex) }.sort_by(&:first).each do |k, v|
          yielder.yield k
        end
        @adjacency_list[vertex].each { |v| yielder.yield v }
      end.lazy
    end

    private

    def explore(vertex)
      if unexplored?(vertex)
        info = { vertex: vertex, pre: @clock += 1 }
        @dfs << info

        relations_for(vertex).sort.each { |rel| explore(rel) }

        info[:post] = @clock += 1
      end
    end

    def relations_for(vertex)
      @adjacency_list.each_with_object(Set.new) do |adjacency, relations|
        if adjacency.first == vertex
          relations.merge(adjacency.last)
        elsif adjacency.last.include?(vertex)
          relations << adjacency.first
        end
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
