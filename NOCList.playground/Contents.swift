/*:
# Module Project - NOC List

Greetings agent. Your mission is a top priority for the agency. Please read below for further info.

Our undercover agents in Eastern Europe are in trouble. The NOC list (Non-official cover) has been leaked and we need our directors to have quick access to the information so we can try to mitigate the damage. Some of the agents on the list have an access level that makes them privy to very sensitive information. We need an application that will present the NOC list's information in a quickly digestible format. Our top agents have been working on it, but we need this done ASAP and you've proven yourself to be quite capable of a quick turnaround.

The Director herself has given you access to all the agency's resources to complete this mission. We're counting on you agent.

Here is the complete NOC List. This information is classified at the highest levels, so guard it very carefully.

 ---
 
 * coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: false
 * coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: true
 * coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false
 * coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true
 * coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false
 * coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false
 * coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true
 * coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false
 * coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true
 * coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true
 * coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false
 
 ---

This message will self destruct in 5 seconds.
*/
//: ## Step 1
//: Create constants for each of the above agents and store all their information in a tuple.

let ethan = (coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: false)
let jim = (coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: true)
let claire = (coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false)
let eugene = (coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true)
let franz = (coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false)
let luther = (coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false)
let sarah = (coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true)
let max = (coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false)
let hannah = (coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true)
let jack = (coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true)
let frank = (coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false)

//: ## Step 2
//: Place the above constants inside an array. Declare this array as a constant as well.

let agents = [ethan, jim, claire, eugene, franz, luther, sarah, max, hannah, jack, frank]

//: ## Step 3
//: Create a function that calculates the total number of compromised agents. Inside the function, iterate over the array of agents to determine which ones are compromised. Return the total count.

/* alternate func input:
 `func totalCompromisedAgents(_ agentList: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)]) -> Int {}`
 then use `agentList` instead of `agents` within func
 */

func totalCompromisedAgents() -> Int {
    var numCompromisedAgents = 0
    
    for agent in agents {
        if agent.compromised {
            numCompromisedAgents += 1
        }
    }
    
    return numCompromisedAgents
}

//: ## Step 4
//: Call the above function to find the total number of compromised agents and then print a sentence that says "# agents have been compromised!" using string interpolation.

print("\(totalCompromisedAgents()) agents have been compromised!")

//: ## Step 5
//: Create a function called "findCleanAgents" that both prints the cover names of all uncompromised agents, as well as returns an array of agents that are uncompromised.

func findCleanAgents() -> [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)] {
    var cleanAgents = [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)]()
    
    for agent in agents {
        if !agent.compromised {
            cleanAgents.append(agent)
            print(agent.coverName)
        }
    }
    
    return cleanAgents
}

//: ## Step 6
//: Call the above function to find the total number of clean agents and print a message that says "# clean agents out of # total agents." Use the total number of agents in the array from step 2 as the second number in the string.

let cleanAgents = findCleanAgents()
print("\(cleanAgents.count) clean agents out of \(agents.count) total agents.")

//: ## Step 7
//: Create a function called "findHighRisk" that prints out the real names and access levels of agents with level 8 or higher. If one of these agents is also currently compromised, add `**WARNING** **COMPROMISED**` to the end of the string that includes their name and access level.
//: - Example: `Jon Voight, level: 9 **WARNING** **COMPROMISED**`

func findHighRisk() {
    for agent in agents {
        if agent.accessLevel >= 8 {
            var agentText = "\(agent.realName), level: \(agent.accessLevel)"
            if agent.compromised {
                agentText += " **WARNING** **COMPROMISED**"
            }
            print(agentText)
        }
    }
}

//: ## Step 8
//: Call the above function and check the output in the console to ensure it is functioning properly.

findHighRisk()

//: ## Step 9
//: Create a function that finds totals for low, mid, and high level agents. Low level agents are 4 or lower, mid are 5-7, and high level agents are 8 or above. Iterate over each agent and use a `switch` statement to determine their level group. At the end of the function, print a statement like the following: "# low level agents, # mid level agents, and # high level agents"

func accessTierTotals() {
    var lowTierTotal = 0
    var midTierTotal = 0
    var highTierTotal = 0
    
    for agent in agents {
        switch agent.accessLevel {
        case 0...4:
            lowTierTotal += 1
        case 5...7:
            midTierTotal += 1
        case 8...10:
            highTierTotal += 1
        default:
            print("ERROR")
        }
    }
    
    print("\(lowTierTotal) low level agents, \(midTierTotal) mid level agents, and \(highTierTotal) high level agents")
}

//: ## Step 10
//: Call the above function and check its output in the console.

accessTierTotals()

//: ## Step 11 (Optional)
//: Create and call a function that prints the cover names and access levels of all agents, but the list should be sorted by access level, in ascending order.

func agentsSortedByAccess() {
    let sortedAgents = agents.sorted {
        $0.accessLevel < $1.accessLevel
    }
    
    for agent in sortedAgents {
        print("\(agent.coverName), level \(agent.accessLevel)")
    }
}

agentsSortedByAccess()

//: --------
//: ## Additional Fun
//: Just for fun/practice I decided to re-implement some stuff in a way that might be a tad better in some ways, especially for step 5 and in function constructors.

print("\n---------\n[[stuff below is additional stuff just for fun and practice]]\n---------")

struct Agent {
    let coverName: String
    let realName: String
    let accessLevel: UInt8
    let compromised: Bool
}

let ethan2 = Agent(coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: false)
let jim2 = Agent(coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: true)
let claire2 = Agent(coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false)
let eugene2 = Agent(coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true)
let franz2 = Agent(coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false)
let luther2 = Agent(coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false)
let sarah2 = Agent(coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true)
let max2 = Agent(coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false)
let hannah2 = Agent(coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true)
let jack2 = Agent(coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true)
let frank2 = Agent(coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false)

let agents2 = [ethan2, jim2, claire2, eugene2, franz2, luther2, sarah2, max2, hannah2, jack2, frank2]

func totalCompromisedAgents2(_ agentList: [Agent]) -> Int {
    var numCompromisedAgents = 0
    
    for agent in agentList {
        if agent.compromised {
            numCompromisedAgents += 1
        }
    }
    
    return numCompromisedAgents
}

print("\(totalCompromisedAgents2(agents2)) agents have been compromised!")

func findCleanAgents2(_ agentList: [Agent]) -> [Agent] {
    var cleanAgents = [Agent]()
    
    for agent in agentList {
        if !agent.compromised {
            cleanAgents.append(agent)
            print(agent.coverName)
        }
    }
    
    return cleanAgents
}

let cleanAgents2 = findCleanAgents2(agents2)
print("\(cleanAgents2.count) clean agents out of \(agents2.count) total agents.")
