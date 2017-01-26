/* Dijkstra’s Two-Stack Algorithm for Expression Evaluation 
 * Adapted from Algorithms, 4th ed. implementation (http://algs4.cs.princeton.edu/13stacks/Evaluate.java.html)
 * Evaluates basic mathematic string expressions
 * Author: Kendrick Ledet 2016 * kennyvledet@gmail.com
 */
import java.util.Stack;

public class ExpressionEvaluation {
	public static double evaluate(String expression) {
		// expression needs spaces between parentheses, operators and operands
		// Each operation, for every 2 operands, must be enclosed in parenthesis
		// Example: ( ( 10 * 10 ) * ( 10 * 10 ) ) instead of ( 10 * 10 * 10 * 10 )

		Stack<String> operators = new Stack<String>();
		Stack<Double> operands = new Stack<Double>();

		for (String token : expression.split(" ")) {
			switch (token) {
				case "(":
					continue;
				case "+":
				case "-":
				case "*":
				case "/":
				case "sqrt":
					operators.push(token); break;
				case ")":  // Pop operand, apply operator and push result
					String operator = operators.pop();
					double value = operands.pop();

					switch (operator) {
						case "+": value = operands.pop() + value; break;
						case "-": value = operands.pop() - value; break;
						case "*": value = operands.pop() * value; break;
						case "/": value = operands.pop() / value; break;
						case "sqrt": value = Math.sqrt(value); break;
					}
					operands.push(value);
					break;
				default:
					operands.push(Double.parseDouble(token));
			}
		}
		return operands.pop();
	}

	public static void main(String[] args) {
		// Test client

		// Should pass
		for (double x = 0; x < 100; x++) {
			for (double y = 0; y < 100; y++) {
				String expression = "( ( "+x+" * "+x+" ) * ( "+y+" * "+y+" ) )";
				if ( ( evaluate(expression) != ( x * x * ( y * y ) ) ) )
					throw new AssertionError();
			}
		}

		String testExpression = "( ( 10 * 10 ) * ( 10 * 10 ) )";
		System.out.println(evaluate(testExpression));  // == 10000.0

		// Should pass
		if ( evaluate(testExpression) != 10000.0 )
			throw new AssertionError();
	}
}