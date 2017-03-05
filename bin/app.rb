#!/usr/bin/env ruby
lib = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "cipher"
cipher = Cipher.new


puts "Please enter some text:"
input_text = gets

filtered_text = cipher.remove_punctuation(input_text)
puts "\nFiltered text:\n#{filtered_text}"

ciphered_text = cipher.cipher(filtered_text, 3)
puts "\nCiphered text:\n#{ciphered_text}"

output_text = cipher.format_blocks(ciphered_text, 5)
puts "\nOutput text:\n#{output_text}"
