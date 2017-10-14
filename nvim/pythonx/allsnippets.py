def wrap_description(description, line_length, used_length, character):

    num_characters = line_length - used_length - len(description) - 2

    if (num_characters % 2 == 0):
        side1 = side2 = num_characters // 2
    else:
        side1 = num_characters // 2 + 1
        side2 = side1 + 1

    def multiply_string(string, x):
        return ''.join([string for i in range(x)])

    string_wrap = multiply_string(character, side1) + ' ' + description + ' ' + multiply_string(character, side2)

    return string_wrap
