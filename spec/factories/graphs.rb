FactoryGirl.define do
  factory :graph_3_1, class: 'Edu::UndirectedGraph' do
    after(:build) do |graph|
      graph.add_edge('A', 'B')
      graph.add_edge('A', 'E')
      graph.add_edge('B', 'E')
      graph.add_edge('B', 'C')
      graph.add_edge('E', 'F')
      graph.add_edge('C', 'F')
      graph.add_edge('F', 'I')
      graph.add_edge('D', 'G')
      graph.add_edge('D', 'H')
      graph.add_edge('G', 'H')
    end
  end
end
