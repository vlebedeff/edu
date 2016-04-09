require 'spec_helper'

module Edu
  describe UndirectedGraph do
    subject { build(:graph_3_1) }

    specify '#each_vertex' do
      expect(subject.each_vertex.to_a).to eq(%w(A B C D E F G H I))
    end

    specify '#each_adjacent' do
      expect(subject.each_adjacent('A').to_a).to eq(%w(B E))
      expect(subject.each_adjacent('B').to_a).to eq(%w(A C E))
      expect(subject.each_adjacent('C').to_a).to eq(%w(B F))
      expect(subject.each_adjacent('D').to_a).to eq(%w(G H))
      expect(subject.each_adjacent('E').to_a).to eq(%w(A B F))
      expect(subject.each_adjacent('F').to_a).to eq(%w(C E I))
      expect(subject.each_adjacent('G').to_a).to eq(%w(D H))
      expect(subject.each_adjacent('H').to_a).to eq(%w(D G))
      expect(subject.each_adjacent('I').to_a).to eq(%w(F))
    end

    describe 'ex. 3.1' do
      specify 'pre & post numbers' do
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
end
