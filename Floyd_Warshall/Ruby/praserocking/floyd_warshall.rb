# => Floyd–Warshall algorithm is a graph analysis algorithm for finding shortest paths in a weighted graph 
# => with positive or negative edge weights (but with no negative cycles) and also for finding transitive closure 
# => of a relation R. A single execution of the algorithm will find the lengths (summed weights) of the shortest paths 
# => between all pairs of vertices, though it does not return details of the paths themselves.
class FloydWarshall
	def floyd_warshall(graph,node_count)
		node_count.times do |i|
			node_count.times do |j|
				node_count.times do |k|
					graph[i][j] = graph[i][k] + graph[k][j] if graph[i][j] > graph[i][k] + graph[k][j]
				end
			end
		end
		graph
	end
end

#driver code

app = FloydWarshall.new
graph = []
		
print "Enter Number of Nodes in the Graph: "
node_count = gets.chomp.to_i
		
puts "Enter Adjacency Matrix"	#Enter the distances from a node to all other nodes in a new line,seperated by spaces
node_count.times do |i|
	graph[i] = gets.chomp.split(' ').map{|e| e.to_i}
end

puts "Adjacency Matrix with Shortest Paths"
app.floyd_warshall(graph,node_count).each do |i|
	puts i.join(" ")
end