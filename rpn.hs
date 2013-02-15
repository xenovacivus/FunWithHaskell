
-- | Various math functions
add x y = x + y
sub x y = x - y
mul x y = x * y
div' x y = x / y

-- | Lookup table for operators and related functions
get_function o
    | o == "+" = add
    | o == "-" = sub
    | o == "*" = mul
    | o == "/" = div'

-- | Calculate one rpn operation: I.E, calc_rpn 1 2 "+" returns 3
calc_rpn a b operator_string = get_function(operator_string) a b

-- | Helper function to translate between a list and parameters for the calc_rpn function
calc_rpn_from_list x = calc_rpn (read (x!!0) :: Float) (read (x!!1) :: Float) (x!!2)

-- | Calculate an entire rpn operation in the form of a list of strings
parse_rpn_list x
    | (length x) == 3 = calc_rpn_from_list x
    | (length x) > 3 = parse_rpn_list ((show (calc_rpn_from_list x)):drop 3 x)

-- | Example Usage: parse_rpn_list ["1", "1", "+", "1", "+", "1.2", "/"]