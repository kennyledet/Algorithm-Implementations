import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.PriorityQueue;
import java.util.Set;

public class PrimMST {
    private Map<Integer, HashMap<Integer, Double>> adjacencyList = new HashMap<Integer, HashMap<Integer, Double>>();
    private Set<Integer> mst = new HashSet<Integer>();

    public Set<Integer> getMST() {
        return mst;
    }

    public void addEdge(int from, int to, double weight) {
        if (adjacencyList.containsKey(from)) {
            adjacencyList.get(from).put(to, weight);
        } else {
            HashMap<Integer, Double> edges = new HashMap<Integer, Double>();
            edges.put(to, weight);
            adjacencyList.put(from, edges);
        }
    }
    
    public double prim(int start) {
        Integer lastInserted = start;
        double sum = 0;

        PriorityQueue<WeightedEdge> possibleEdges = new PriorityQueue<WeightedEdge>();
        HashSet<Integer> visited = new HashSet<Integer>();
        visited.add(start);

        while (adjacencyList.size() != visited.size()) {
            for (Entry<Integer, Double> nw : neighborsAndWeight(lastInserted)) {
                possibleEdges.add(new WeightedEdge(lastInserted, nw.getKey(), nw.getValue()));
            }

            if (possibleEdges.size() > 0) {
                WeightedEdge edge = possibleEdges.poll();

                while (visited.contains(edge.to)) {
                    edge = possibleEdges.poll();
                }

                mst.add(edge.to);
                visited.add(edge.to);
                lastInserted = edge.to;
                sum += edge.weight;
            }
        }

        return sum;
    }

    private Set<Entry<Integer, Double>> neighborsAndWeight(int node) {
            Set<Entry<Integer, Double>> neighborsAndWeight = new HashSet<Entry<Integer, Double>>();
            if (adjacencyList.containsKey(node)) {
                neighborsAndWeight = adjacencyList.get(node).entrySet();
            }
            return neighborsAndWeight;
    }

    private class WeightedEdge implements Comparable<WeightedEdge> {
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
