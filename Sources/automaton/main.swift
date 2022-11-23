import Foundation

print("number of states: ")
let num_of_state = Int(readLine(strippingNewline: true)!)!

var states : [Character] = Array(repeating: "A", count: num_of_state)


print("size of alphabet : ")


let size_of_alpha = Int(readLine(strippingNewline: true)!)!


print("input the accept states (split by whitespace)")

let accept_states = readLine()!.components(separatedBy: " ").map{ (a: String)->(Int) in
    return Int(a)!
}

for state in accept_states {
    states[state] = "B";
}


var table = 
Array(repeating: Array(repeating: 0, count: size_of_alpha), count: num_of_state)

print("input the automaton")
for i in 0..<num_of_state {
    let next_states = readLine()!.components(separatedBy: " ").map{ (a: String)->(Int) in
    return Int(a)!
    }    
    assert(next_states.count == size_of_alpha)
    for j in 0..<size_of_alpha {
        table[i][j] = next_states[j]
    }
}


while(true) {
    var cnt = 0
    var used_str = [String : Int]()   
    var next_states : [Character] = Array(repeating: "A", count: num_of_state)
    for (state, to) in table.enumerated() {
        var str = ""
        for next_state in to {
            str.append(states[next_state])
        }
        if let used_state = used_str[str]  {
            next_states[state] = next_states[used_state]
        } else {
            used_str[str] = state
            next_states[state] = Character(UnicodeScalar(65 + cnt)!)
            cnt += 1
        } 
    }
    print(states)
    if states.elementsEqual(next_states) {
        print("answer is: ")
        print(String(next_states))
        break    
    } else {
        for (index, symbol) in next_states.enumerated() {
           states[index] = symbol
        }
    }  
}




