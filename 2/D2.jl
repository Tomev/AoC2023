function get_balls_from_draw(draw)
    balls = Dict("red" => 0, "blue" => 0, "green" => 0)

    parts = split(draw, ", ")

    for part in parts
        number, color = split(part, " ")
        balls[color] = parse(Int64, number)
    end

    return balls

end

function get_possible_balls_number(line)
    balls = Dict("red" => 0, "blue" => 0, "green" => 0)

    parts = split(line, ": ")
    deleteat!(parts, 1)

    for part in parts
        draws = split(part, "; ")
        
        for draw in draws
            balls_drawn = get_balls_from_draw(draw)

            for (color, number) in balls
                balls[color] = max(number, balls_drawn[color]) 
            end

        end

    end

    return balls
end

function is_game_possible(balls)
    balls_limits = Dict("red" => 12, "green" => 13, "blue" => 14)
    
    for (color, limit) in balls_limits
        if balls[color] > limit
            return false
        end
    end

    return true
end


function problem1()
    
    i = 1
    ids_sum = 0

    open("in1.txt", "r") do file
        for line in eachline(file)
            balls = get_possible_balls_number(line)
            if is_game_possible(balls)
                # println("Game is possible")
                ids_sum += i
            end
            i += 1
        end
    end

    println("The sum of the ids of the possible games is: ", ids_sum)
end

function problem2()
    println("Problem 2")    
    powerset_sum = 0
    
    open("in1.txt", "r") do file
        for line in eachline(file)
            min_balls = get_possible_balls_number(line)
            powerset = 1
            
            for (color, number) in min_balls
                powerset *= number
            end

        #println(powerset)
        powerset_sum += powerset

            
        end
    end

    println("The sum of powersets is: ", powerset_sum)
end


function main()
    cd(dirname(@__FILE__))

    #problem1()
    problem2()
end



main()