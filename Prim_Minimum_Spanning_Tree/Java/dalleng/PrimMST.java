import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.PriorityQueue;
import java.util.Scanner;
import java.util.Set;

public class PrimMST {
	static Map<Integer, HashMap<Integer, Double>> adjacencyList = new HashMap<Integer, HashMap<Integer, Double>>();
	static Set<Integer> mst = new HashSet<Integer>();

	static void addEdge(int from, int to, double weight) {
		if (adjacencyList.containsKey(from)) {
			adjacencyList.get(from).put(to, weight);
		} else {
			HashMap<Integer, Double> edges = new HashMap<Integer, Double>();
			edges.put(to, weight);
			adjacencyList.put(from, edges);
		}
	}


	static Set<Entry<Integer, Double>> neighborsAndWeight(int node) {
		Set<Entry<Integer, Double>> neighborsAndWeight = new HashSet<Entry<Integer, Double>>();
		if (adjacencyList.containsKey(node)) {
			neighborsAndWeight = adjacencyList.get(node).entrySet();
		}
		return neighborsAndWeight;
	}

	static double prim(int start) {
		HashSet<Integer> visited = new HashSet<Integer>();
		Integer lastInserted = start;
		double sum = 0;
		visited.add(start);

		PriorityQueue<WeightedEdge> possibleEdges = new PriorityQueue<Main.WeightedEdge>();

		while (adjacencyList.size() != visited.size()) {
			for (Entry<Integer, Double> nw : neighborsAndWeight(lastInserted)) {
				possibleEdges.add(new WeightedEdge(lastInserted, nw.getKey(), nw.getValue()));
			}

            WeightedEdge edge = possibleEdges.poll();

            while (visited.contains(edge.to)) {
                edge = possibleEdges.poll();
            }

            mst.add(edge.to);
            visited.add(edge.to);
            lastInserted = edge.to;
            sum += edge.weight;
        }

		return sum;
	}

	static class WeightedEdge implements Comparable<WeightedEdge> {
		public int from;
		public int to;
		public double weight;

		public WeightedEdge(int from, int to, double weight) {
			super();
			this.from = from;
			this.to = to;
			this.weight = weight;
		}

		@Override
		public int compareTo(WeightedEdge anotherElement) {
			int ret;

			if (this.weight < anotherElement.weight) {
				ret = -1;
			} else if (this.weight == anotherElement.weight) {
				ret = 0;
			} else {
				ret = 1;
			}

			return ret;
		}

	}

}
