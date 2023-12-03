function get_problem_array()
    open("test.txt", "r") do file
        problem_array = []
        for line in eachline(file)
            push!(problem_array, line)
        end
        return problem_array
    end
end

function find_numbers_range(problem_array)

    numbers_range = []

    for line in problem_array
        numbers = split(line, "-")
        push!(numbers_range, parse(Int64, numbers[1]))
        push!(numbers_range, parse(Int64, numbers[2]))
    end

    return numbers_range


end

function find_symbols(problem_array)
    symbols = Set()

    for line in problem_array
        for char in line
            if  !isdigit(char) && char != '.'
                push!(symbols, char)
            end
        end
    end

    return symbols

end

function problem1()
    problem_array = get_problem_array()
    symbols = find_symbols(problem_array)

    println(problem_array)
end

function main()
    cd(dirname(@__FILE__))

    problem1()
end

main()