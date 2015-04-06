#include<iostream>
#include<vector>
#include<string>
#include<set>
#include<stack>

using namespace std;


struct trans {
	int vertex_from;
	int vertex_to;
	char trans_symbol;
};


class NFA {
public:
	vector<int> vertex;
	vector<trans> transitions;
	int final_state;

	NFA() {

	}

	int get_vertex_count() {
		return vertex.size();
	}

	void set_vertex(int no_vertex) {
		for(int i = 0; i < no_vertex; i++) {
			vertex.push_back(i);
		}
	}

	void set_transition(int vertex_from, int vertex_to, char trans_symbol) {
		trans new_trans;
		new_trans.vertex_from = vertex_from;
		new_trans.vertex_to = vertex_to;
		new_trans.trans_symbol = trans_symbol;
		transitions.push_back(new_trans);
	}

	void set_final_state(int fs) {
		final_state = fs;
	}

	int get_final_state() {
		return final_state;
	}

	void display() {
		trans new_trans;
		cout<<"\n";
		for(int i = 0; i < transitions.size(); i++) {
			new_trans = transitions.at(i);
			cout<<"q"<<new_trans.vertex_from<<" --> q"<<new_trans.vertex_to<<" : Symbol - "<<new_trans.trans_symbol<<endl;
		}
		cout<<"\nThe final state is q"<<get_final_state()<<endl;
	}
};



NFA concat(NFA a, NFA b) {
	NFA result;
	result.set_vertex(a.get_vertex_count() + b.get_vertex_count());
	int i;
	trans new_trans;

	for(i = 0; i < a.transitions.size(); i++) {
		new_trans = a.transitions.at(i);
		result.set_transition(new_trans.vertex_from, new_trans.vertex_to, new_trans.trans_symbol);
	}

	result.set_transition(a.get_final_state(), a.get_vertex_count(), '^');

	for(i = 0; i < b.transitions.size(); i++) {
		new_trans = b.transitions.at(i);
		result.set_transition(new_trans.vertex_from + a.get_vertex_count(), new_trans.vertex_to + a.get_vertex_count(), new_trans.trans_symbol);
	}

	result.set_final_state(a.get_vertex_count() + b.get_vertex_count() - 1);

	return result;
}


NFA kleene(NFA a) {
	NFA result;
	int i;
	trans new_trans;
	
	result.set_vertex(a.get_vertex_count() + 2);

	result.set_transition(0, 1, '^');

	for(i = 0; i < a.transitions.size(); i++) {
		new_trans = a.transitions.at(i);
		result.set_transition(new_trans.vertex_from + 1, new_trans.vertex_to + 1, new_trans.trans_symbol);
	}

	result.set_transition(a.get_vertex_count(), a.get_vertex_count() + 1, '^');
	result.set_transition(a.get_vertex_count(), 1, '^');
	result.set_transition(0, a.get_vertex_count() + 1, '^');

	result.set_final_state(a.get_vertex_count() + 1);

	return result;
}


NFA or_selection(vector<NFA> selections, int no_of_selections) {
	NFA result;
	int vertex_count = 2;
	int i, j;
	NFA med;
	trans new_trans;

	for(i = 0; i < no_of_selections; i++) {
		vertex_count += selections.at(i).get_vertex_count();
	}

	result.set_vertex(vertex_count);
	
	int adder_track = 1;

	for(i = 0; i < no_of_selections; i++) {
		result.set_transition(0, adder_track, '^');
		med = selections.at(i);
		for(j = 0; j < med.transitions.size(); j++) {
			new_trans = med.transitions.at(j);
			result.set_transition(new_trans.vertex_from + adder_track, new_trans.vertex_to + adder_track, new_trans.trans_symbol);
		}
		adder_track += med.get_vertex_count();

		result.set_transition(adder_track - 1, vertex_count - 1, '^');
	}

	result.set_final_state(vertex_count - 1);

	return result;
}


NFA re_to_nfa(string re) {
	stack<char> operators;
	stack<NFA> operands;
	char op_sym;
	int op_count;
	char cur_sym;
	NFA *new_sym;
	
	for(string::iterator it = re.begin(); it != re.end(); ++it) {
		cur_sym = *it;
		if(cur_sym != '(' && cur_sym != ')' && cur_sym != '*' && cur_sym != '|' && cur_sym != '.') {
			new_sym = new NFA();
			new_sym->set_vertex(2);
			new_sym->set_transition(0, 1, cur_sym);
			new_sym->set_final_state(1);
			operands.push(*new_sym);
			delete new_sym;
		} else {
			if(cur_sym == '*') {
				NFA star_sym = operands.top();
				operands.pop();
				operands.push(kleene(star_sym));
			} else if(cur_sym == '.') {
				operators.push(cur_sym);
			} else if(cur_sym == '|') {
				operators.push(cur_sym);
			} else if(cur_sym == '(') {
				operators.push(cur_sym);
			} else {
				op_count = 0;
				char c;
				op_sym = operators.top();
				if(op_sym == '(') continue;
				do {
					operators.pop();
					op_count++;
				} while(operators.top() != '(');
				operators.pop();
				NFA op1;
				NFA op2;
				vector<NFA> selections;
				if(op_sym == '.') {
					for(int i = 0; i < op_count; i++) {
						op2 = operands.top();
						operands.pop();
						op1 = operands.top();
						operands.pop();
						operands.push(concat(op1, op2));
					}
				} else if(op_sym == '|'){
					selections.assign(op_count + 1, NFA());
					int tracker = op_count;
					for(int i = 0; i < op_count + 1; i++) {
						selections.at(tracker) = operands.top();
						tracker--;
						operands.pop();
					}
					operands.push(or_selection(selections, op_count+1));
				} else {
					
				}
			}
		}
	}

	return operands.top();
}


int main() {
	cout<<"\n\nThe Thompson's Construction Algorithm takes a regular expression as an input "
		<<"and returns its corresponding Non-Deterministic Finite Automaton \n\n";
	cout<<"\n\nThe basic building blocks for constructing the NFA are : \n";

	NFA a, b;

	cout<<"\nFor the regular expression segment : (a)";
	a.set_vertex(2);
	a.set_transition(0, 1, 'a');
	a.set_final_state(1);
	a.display();
//	getch();

	cout<<"\nFor the regular expression segment : (b)";
	b.set_vertex(2);
	b.set_transition(0, 1, 'b');
	b.set_final_state(1);
	b.display();
//	getch();

	cout<<"\nFor the regular expression segment [Concatenation] : (a.b)";
	NFA ab = concat(a, b);
	ab.display();
//	getch();

	cout<<"\nFor the regular expression segment [Kleene Closure] : (a*)";
	NFA a_star = kleene(a);
	a_star.display();
//	getch();

	cout<<"\nFor the regular expression segment [Or] : (a|b)";
	int no_of_selections;
	no_of_selections = 2;
	vector<NFA> selections(no_of_selections, NFA());
	selections.at(0) = a;
	selections.at(1) = b;
	NFA a_or_b = or_selection(selections, no_of_selections);
	a_or_b.display();	
//	getch();


	string re;
	set<char> symbols;

	cout<<"\n*****\t*****\t*****\n";
	cout<<"\nFORMAT : \n"
		<<"> Explicitly mention concatenation with a '.' operator \n"
		<<"> Enclose every concatenation and or section by parantheses \n"
		<<"> Enclose the entire regular expression with parantheses \n\n";

	cout<<"For example : \nFor the regular expression (a.(b|c))  -- \n";
	NFA example_nfa = re_to_nfa("(a.(b|c))");
	example_nfa.display();
	
	cout<<"\n\nEnter the regular expression in the above mentioned format - \n\n";
	cin>>re;

/*	char cur_sym;
	int counter = 0;
	for(string::iterator it = re.begin(); it != re.end(); ++it) {
		cur_sym = (*it);
		if(cur_sym != '(' && cur_sym != ')' && cur_sym != '*' && cur_sym != '|' && cur_sym != '.') {
			cout<<cur_sym<<" "<<counter++<<endl;
			symbols.insert(cur_sym);
		}
	}
*/

	cout<<"\n\nThe required NFA has the transitions : \n\n";
	
	NFA required_nfa;
	required_nfa = re_to_nfa(re);
	required_nfa.display();	

	return 0;
}
