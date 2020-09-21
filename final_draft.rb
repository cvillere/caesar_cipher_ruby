#turn input string into array
def orig_array
  puts "Enter the initial string for the caesar cipher translation."
  initial_string = gets.chomp.split("")
end

#down case the first array
def down_case_orig_array(upper_case_array)
  down_case_array = upper_case_array.map{|letter| letter.downcase }
end

#get char code of each array item
def char_code_array(input_array)
  char_codes = input_array.map {|char| char.ord}
end


first_array = orig_array()
down_case_array = down_case_orig_array(first_array)
first_array_codes = char_code_array(down_case_array)

#Determine how many steps you need to shift given input shift number
def shift_factor(shift_number)
  shift_steps = (shift_number).abs % 26
end

#The translation
def translate(char_codes)
  translated_array = []
  puts "Enter the shift factor the caesar cipher translation."
  user_shift_number = gets.chomp.to_i
  shift_steps_number = shift_factor(user_shift_number)

  if user_shift_number < 0
    for code in char_codes do
      if (code - 97 < shift_steps_number) && (code >= 97 && code <= 122) 
        first_shift = code - 97
        remaining_shift = (shift_steps_number - first_shift) - 1
        final_shift = 122 - remaining_shift
        translated_array.push(final_shift)
      elsif code - 97 == shift_steps_number
        translated_array.push(97)
      elsif (code < 97 || code > 122) 
        translated_array.push(code)
      else
        translated_array.push(code - shift_steps_number)
      end
    end
  elsif user_shift_number > 0
    for code in char_codes do
      if (122 - code < shift_steps_number) && (code >= 97 && code <= 122)
        first_shift = 122 - code
        remaining_shift = (shift_steps_number - first_shift) - 1
        final_shift = 97 + remaining_shift
        translated_array.push(final_shift)
      elsif 122 - code == shift_steps_number
        translated_array.push(122)
      elsif (code < 97 || code > 122)
        translated_array.push(code)
      else
        translated_array.push(code + shift_steps_number)
      end
    end     
  else
  end
  translated_array
end

#translate translated char codes back to characters
def back_to_characters(translated_char_codes_array)
  translated_character_array = translated_char_codes_array.map {|code| code.chr}
end

#Perserve capitalization and return translated phrase
def perserve_capitalization(translated_characters, original_characters)
  final_array = []
  original_characters.each_with_index do |item, i|
    if original_characters[i] == original_characters[i].upcase
      final_array.push(translated_characters[i].upcase)
    else
      final_array.push(translated_characters[i])
    end
  end
  final_array.join("")
end

p perserve_capitalization(back_to_characters(translate(first_array_codes)), first_array)

