

function task1()
    f = open(pwd()*"/week1/day1_data.txt");
    lines = readlines(f)
    close(f)
    sum = 0 
    old_number = Inf # larger than the first number 
    for line in lines
        new_number = parse(Int,line)
        if new_number > old_number
            sum += 1
        end
        old_number = new_number
    end
    println(" It incremented $(sum) times in task 1 ")
    return 0
end

function task2()
    f = open(pwd()*"/week1/day1_data.txt");
    lines = readlines(f)
    close(f)
    vec = Int32[]; filter = Int32[1,1,1] 
    for line in lines
        push!(vec, parse(Int32,line))  
    end
    my_sum = 0 
    old_number = Inf # larger than the first number 
    for i in 1:length(vec)-length(filter)+1
        new_number = sum(vec[i:i+length(filter)-1].*filter)
        if new_number > old_number
            my_sum += 1
        end
        old_number = new_number
    end

    println(" It incremented $(my_sum) times in task 2 ")
    return 0
end



task1()

task2()