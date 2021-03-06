# Faker::Number

```ruby
# Required parameter: digits
Faker::Number.number(10) #=> "1968353479"

# Required parameter: digits
Faker::Number.leading_zero_number(10) #=> "0669336915"

# Required parameter: digits
Faker::Number.decimal_part(2) #=> "0074009009"

# Required parameter: l_digits
Faker::Number.decimal(2) #=> "11.88"

Faker::Number.decimal(2, 3) #=> "18.843"

# Required parameters: mean, standard_deviation
Faker::Number.normal(50, 3.5) #=> 47.14669604069156

# Required parameter: digits
Faker::Number.hexadecimal(3) #=> "e74"

# Required parameters: minimum value, maximum value
# Boundary numbers are inclusive
Faker::Number.between(1, 10) #=> 7

Faker::Number.positive #=> 235.59238499107653

Faker::Number.negative #=> -4480.042585669558

Faker::Number.non_zero_digit #=> "8"

Faker::Number.digit #=> "1"

Faker::Number.part_number(15342.21) #=> 15,342.21
```
