import java.util.HashMap;

/*
 * The Floyd-Warshall algorithm is used to find the shortest path between
 * any pair of nodes in a weighted graph with either positive or negative edge
 * weights but without negative edge cycles.
 * 
 * The running time of the algorithm is O(n^3), being n the number of nodes in
 * the graph.
 */

public class FloydWarshall {

	static HashMap<Integer, HashMap<Integer, Integer>> adjacencyList = new HashMap<Integer, HashMap<Integer, Integer>>();
	static boolean hasNegativeCycle;

	// utility function to add edges to the adjacencyList
	static void addOrUpdateEdge(int from, int to, int weight) {
		if (adjacencyList.containsKey(from)) {
			adjacencyList.get(from).put(to, weight);
		} else {
			HashMap<Integer, Integer> edges = new HashMap<Integer, Integer>();
			edges.put(to, weight);
			adjacencyList.put(from, edges);
		}
	}

	// all-pairs shortest path
	static double[][] floydWarshall(int n) {
		double[][] distances = new double[n][n];

		// initialize the distances matrix from the adjacencyList
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if (i == j) {
					distances[i][j] = 0;
				} else {
					if (adjacencyList.containsKey(i)) {
						if (adjacencyList.get(i).containsKey(j)) {
							distances[i][j] = adjacencyList.get(i).get(j);
						} else {
							distances[i][j] = Double.POSITIVE_INFINITY;
						}
					} else {
						distances[i][j] = Double.POSITIVE_INFINITY;
					}
				}
			}
		}

		for (int k = 0; k < n; k++) {
			for (int i = 0; i < n; i++) {
				for (int j = 0; j < n; j++) {
					distances[i][j] = Math.min(distances[i][j], distances[i][k] + distances[k][j]);
				}
			}

			if (distances[k][k] < 0.0) {
				hasNegativeCycle = true;
			}
		}

		return distances;
	}

}
