# frozen_string_literal: true
require "cipher"

describe Cipher do
  describe "#remove_punctuation" do
    it "removes all non-letter characters" do
      expect(subject.remove_punctuation("Hello, this is a test!!")).to eq "Hellothisisatest"
    end
  end

  describe "#cipher" do
    it "applies a caesar chiper with the given shift to the input text" do
      expect(subject.cipher("abcxyz", 3)).to eq "defabc"
      expect(subject.cipher("ABCXYZ", 3)).to eq "DEFABC"
    end

    it "supports negative shifts" do
      expect(subject.cipher("defabc", -3)).to eq "abcxyz"
      expect(subject.cipher("DEFABC", -3)).to eq "ABCXYZ"
    end
  end

  describe "#format_blocks" do
    it "formats the input text into blocks of the given size padded with Xs" do
      expect(subject.format_blocks("abcdefghij", 5)).to eq "ABCDE FGHIJ"
      expect(subject.format_blocks("abcdefghijkl", 5)).to eq "ABCDE FGHIJ KLXXX"
    end
  end

  describe "integration test" do
    it "removes punctuation, applies a caesar cipher, and formats the output" do
      input = "Hello, this is a test!"
      filtered_text = subject.remove_punctuation(input)
      ciphered_text = subject.cipher(filtered_text, 3)
      output = subject.format_blocks(ciphered_text, 5)
      expect(output).to eq "KHOOR WKLVL VDWHV WXXXX"
    end
  end
end
