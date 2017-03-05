# frozen_string_literal: true
class Cipher
  def remove_punctuation input
    input.gsub(/[^a-zA-Z]/, "")
  end

  def cipher input, shift
    input.each_char.map {|c| cipher_char(c, shift) }.join
  end

  def format_blocks input, block_size
    input.each_char.each_slice(block_size).map {|block|
      block.join.upcase + ("X" * (block_size - block.length))
    }.join(" ")
  end

  private

  def cipher_char c, shift
    base = ("a".."z").cover?(c) ? "a".ord : "A".ord
    new_c = c.ord - base
    new_c = (new_c + shift) % 26
    new_c += 26 if new_c.negative?
    (new_c + base).chr
  end
end
