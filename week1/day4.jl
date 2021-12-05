function check_board(board,numbers)
    for i in 1:size(board,1)
        if size(board,2) == length(intersect(numbers,board[i,:]))
            #println(board[i,:])
            return true, setdiff(board,numbers), numbers[end] 
        end
    end
    for i in 1:size(board,2)
        if size(board,1) ==length(intersect(numbers,board[:,i]))
            #println(board[:,i])
            return true, setdiff(board,numbers), numbers[end]
        end
    end
    return false, [], numbers[end]
end

function task1()
    f = open(pwd()*"/week1/day4_data.txt");
    lines = readlines(f)
    close(f)

    pulled_numbers = [parse(Int32, num) for num in split(lines[1],",")]
    println(pulled_numbers)
    boards =Array{Int32,2}[]
    current_board = zeros(Int32,5,5)
    row = 1
    for line in lines[3:end]
        if line == ""
            push!(boards, current_board)
            current_board = zeros(Int32,5,5)
            row = 1
        else
            for (column,l) in enumerate(split(line))
                current_board[row,column] = parse(Int32,l)
            end
            row += 1
        end
    end
    push!(boards, current_board)
    println(boards)
    for i in 1:length(pulled_numbers)
        for board in boards
           bingo, remaining_numbers, last= check_board(board,pulled_numbers[1:i])
           if (bingo) 
                println("bingo")
                return sum(remaining_numbers)*last  
           end
        end
    end
    return 0
end

function task2()
    f = open(pwd()*"/week1/day4_data.txt");
    lines = readlines(f)
    close(f)

    pulled_numbers = [parse(Int32, num) for num in split(lines[1],",")]
    boards =Array{Int32,2}[]
    current_board = zeros(Int32,5,5)
    row = 1
    for line in lines[3:end]
        if line == ""
            push!(boards, current_board)
            current_board = zeros(Int32,5,5)
            row = 1
        else
            for (column,l) in enumerate(split(line))
                current_board[row,column] = parse(Int32,l)
            end
            row += 1
        end
    end
    results = []
    bingo_indexes = [] 
    for i in 1:length(pulled_numbers)

        for j in 1:length(boards)
            if j in bingo_indexes
                continue
            end
            bingo, remaining_numbers, last= check_board(boards[j], pulled_numbers[1:i])
            if (bingo) 
                #println("bingo")
                push!(results, sum(remaining_numbers)*last) 
                push!(bingo_indexes,j) 
            end
        end
    end
    println(results)
    return results[end]
end

#task1()
task2()