
function to_base_10(vec)
    a = 0
    for (i,v) in enumerate(reverse(vec))
        a += v*2^(i-1) 
    end
    return a 
end

function keep_index(vec, digit)
    result = []
    for (i,v) in enumerate(vec)
        if v == digit
            push!(result,i)
        end
    end
    return result
end

function task1()

    f = open(pwd()*"/week1/day3_data.txt");
    lines = readlines(f)
    close(f)
 
    A = Int64[]
    for line in lines
        temp = Int32[]
        for c in line
            push!(temp, parse(Int32,c))
        end
        A = [A;temp] 
    end
    A = reshape(A,:,size(lines,1))
    println(sum(A,dims = 2)./size(A,2))
    println(size(A))
    gamma = convert.(Int32,round.(sum(A,dims = 2)./size(A,2), digits =0))
    gamma = reshape(gamma,:)
    epsilon = Int32[]
    for g in gamma 
        if g == 1
            push!(epsilon,0)
        else
            push!(epsilon,1)
        end
    end
    println("This is gamma   $gamma  \n")
    println("This is epsilon $epsilon  \n")
    result = to_base_10(gamma)*to_base_10(epsilon)
    println("The product of the binary numbers in base 10 is $result\n ")
    return result
end

function task2()

    f = open(pwd()*"/week1/day3_data.txt");
    lines = readlines(f)
    close(f)
 
    A = Int64[]
    for line in lines
        temp = Int32[]
        for c in line
            push!(temp, parse(Int32,c))
        end
        A = [A;temp] 
    end
    A = reshape(A,:,size(lines,1))
    println(sum(A,dims = 2)./size(A,2))
    B = copy(A)
    i = 1
    while(size(B,2)>1)

        n_ones = count(==(1),B[i,:])
        n_zeros = count(==(0),B[i,:])
        if n_ones >=n_zeros
            index =  keep_index(B[i,:],1)
        else
            index = keep_index(B[i,:],0)
        end
        B = B[:,index]
        println("size is $(size(B))")
        i+=1
    end
    C = copy(A)
    i = 1
    while(size(C,2)>1)
        n_ones = count(==(1),C[i,:])
        n_zeros = count(==(0),C[i,:])
        if n_ones < n_zeros
            index =  keep_index(C[i,:],1)
        else
            index = keep_index(C[i,:],0)
        end
        C = C[:,index]
        println("size is $(size(C))")
        i+=1
    end

    result = to_base_10(B[:,1])*to_base_10(C[:,1])
    println("The product of the binary numbers in base 10 is $result\n ")
    return result
end

task1()
task2()