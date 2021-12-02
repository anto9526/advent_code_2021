struct Pos
    x
    z
end

struct State
    x
    z
    aim
end

function execute_intstuction!(instruction, pos::Pos  )
    command = split(instruction)[1]
    size = parse(Int,split(instruction)[2])
    if command == "forward"
       pos = Pos(pos.x+size, pos.z)
    elseif command == "backward"
        pos = Pos(pos.x-size, pos.z)
    elseif command == "up"
        pos = Pos(pos.x, pos.z-size)
    elseif command == "down"
        pos = Pos(pos.x, pos.z+size)
    else 
        println("Command : $(command) not specified!\n")
    end
    return pos
end


function task1()

    f = open(pwd()*"/week1/day2_data.txt");
    lines = readlines(f)
    close(f)
    pos = Pos(0,0)

    for line in lines
        pos = execute_intstuction!(line, pos)
    end
    println("The current position is $(pos)  multiplying these gets you $(pos.x*pos.z) \n")

end
function execute_intstuction2!(instruction, state::State  )
    command = split(instruction)[1]
    size = parse(Int,split(instruction)[2])
    if command == "forward"
       state = State(state.x+size, state.z+state.aim*size, state.aim)
    elseif command == "backward"
        state = State(state.x-size, state.z-state.aim*size,stateaim)
    elseif command == "up"
        state = State(state.x, state.z,state.aim-size)

    elseif command == "down"
        state = State(state.x, state.z,state.aim+size)
    else 
        println("Command : $(command) not specified!\n")
    end
    return state
end

function task1()

    f = open(pwd()*"/week1/day2_data.txt");
    lines = readlines(f)
    close(f)
    pos = State(0,0,0)

    for line in lines
        pos = execute_intstuction2!(line, pos)
    end
    println("The current position is $(pos)  multiplying these gets you $(pos.x*pos.z) \n")

end

task1()
