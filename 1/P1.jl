function get_first_number_in_string(line)
    for char in line 
        if isdigit(char)
            return char
        end
    end
end

function get_last_number_in_string(line)
    for char in reverse(line)
        if isdigit(char)
            return char
        end
    end
end


function problem_1()
    open("in1.txt", "r") do file
        # Iterate over each line in the file
        sum_of_calibration_values = 0
        for line in eachline(file)
            first_number = get_first_number_in_string(line)
            last_number = get_last_number_in_string(line)
            sum_of_calibration_values += parse(Int64, first_number * last_number)
        end

        println("The sum of the calibration values is: ", sum_of_calibration_values)
    end
end

function extract_number(str)
    
    digit_mapping = Dict("zero" => "0", "one" => "1", "two" => "2", "three" => "3", "four" => "4",
                     "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9")

    if length(str) == 1
        return str
    else
        return digit_mapping[str]
    end
end

function find_calibration_number(str)
    substrings_of_interest = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "zero"]
    # Find indices of all substrings
    indices = vcat(map(substring -> findall(substring, str), substrings_of_interest)...)

    # Filter out `nothing` values
    valid_indices = filter!(i -> !isempty(i), indices)

    # print(valid_indices, "\n")

    # Find the minimum index (first occurrence)
    min_index = minimum(valid_indices)
    # Find the maximum index (last occurrence)
    max_index = maximum(valid_indices)
    # print(min_index, "\n")
    # print(max_index, "\n")

    # Find which substring corresponds to this index
    first_number = extract_number(str[min_index])
    last_number = extract_number(str[max_index])

    return parse(Int64, first_number * last_number)
end

function problem_2()
    
    open("in1.txt", "r") do file
        # Iterate over each line in the file
        sum_of_calibration_values = 0
        for line in eachline(file)
            calibration_value = find_calibration_number(line)
            # print(calibration_value, "\n")
            sum_of_calibration_values += calibration_value
        end

        println("The sum of the calibration values is: ", sum_of_calibration_values)
    end
end

function main()
    cd(dirname(@__FILE__))

    # problem_1()
    problem_2()
end

main()