# frozen_string_literal: true

require 'pry'

initial_string = 'ftFgp!'

def caesar_cipher(string, shift)
  string.downcase
  true_shift = shift % 26
  str_array = string.split('')
  str_array.map do |letter|
    shifted_letter = letter.ord + true_shift
    if shifted_letter > 122
      shifted_letter - 26
    elsif shifted_letter < 96
      shifted_letter + 26
    elsif shifted_letter >= 96 && shifted_letter <= 122
      shifted_letter
    end
  end
end

def shift_letters(input)
  shift_letters = input.map(&:chr)
  shift_letters.join('')
end

def compare_strings(string_one, string_two)
  string_one_array = string_one.split('')
  p string_one_array
  string_two_array = string_two.split('')
  p string_two_array
  shift_case_final = []
  n = 0
  while n < string_one_array.length
    if (string_one_array[n].ord >= 65 && string_one_array[n].ord <= 90) == true
      shift_case_final.push(string_two_array[n].upcase)
    elsif string_one_array[n].ord < 97 == true
      shift_case_final.push(string_one_array[n])
    elsif string_one_array[n].ord > 122 == true
      shift_case_final.push(string_one_array[n])
    else
      shift_case_final.push(string_two_array[n])
    end
    n += 1
  end
  shift_case_final
end

shift_ords = caesar_cipher(initial_string, 24)
p shift_ords
shift_string = shift_letters(shift_ords)
p shift_string

p compare_strings(initial_string, shift_string)
