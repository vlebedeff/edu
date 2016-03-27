require 'spec_helper'

module Edu
  describe UndirectedGraph do
    specify 'ex. 3.1' do
      subject.add_edge('A', 'B')
      subject.add_edge('A', 'E')
      subject.add_edge('B', 'E')
      subject.add_edge('B', 'C')
      subject.add_edge('E', 'F')
      subject.add_edge('C', 'F')
      subject.add_edge('F', 'I')
      subject.add_edge('D', 'G')
      subject.add_edge('D', 'H')
      subject.add_edge('G', 'H')

      expect(subject.dfs[0]).to eq({ vertex: 'A', pre: 1, post: 12 })
      expect(subject.dfs[1]).to eq({ vertex: 'B', pre: 2, post: 11 })
      expect(subject.dfs[2]).to eq({ vertex: 'C', pre: 3, post: 10 })
      expect(subject.dfs[3]).to eq({ vertex: 'F', pre: 4, post: 9 })
      expect(subject.dfs[4]).to eq({ vertex: 'E', pre: 5, post: 6 })
      expect(subject.dfs[5]).to eq({ vertex: 'I', pre: 7, post: 8 })
      expect(subject.dfs[6]).to eq({ vertex: 'D', pre: 13, post: 18 })
      expect(subject.dfs[7]).to eq({ vertex: 'G', pre: 14, post: 17 })
      expect(subject.dfs[8]).to eq({ vertex: 'H', pre: 15, post: 16 })
    end
  end
end
