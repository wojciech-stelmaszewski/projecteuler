class Array
  def ascii_array_to_s
    self.map { |asciiCode| asciiCode.chr }.join
  end
end

class String
  @@trigrams = %w(the and ing her hat his tha ere for ent ion ter was you ith ver all wit thi tio)

  #does not work very well
  def calculate_naive_heuristic
    truncated_text = self.gsub(/[^0-9a-z\\s]/i, '').downcase
    truncated_text.length.to_f/self.length
  end

  #good enough
  def calculate_trigrams_heuristic
    trigrams_count = 0
    @@trigrams.each do |trigram|
      trigrams_count += (self.scan trigram).length
    end
    trigrams_count
  end

  def to_ascii_a
    self.each_byte.map { |asciiCode| asciiCode }
  end

end

class CryptographicHelper
  def self.decrypt_array array, key
    array.each_with_index.map do |number, index|
      current_key_character = key[index%key.length]
      number ^ current_key_character
    end
  end
end

class KeyGenerationHelper
  def self.generate_keys2 range, length
    Enumerator.new do |y|
      stack = Array.new(length) { |_| range.first}

      iteration_index = 0
      while iteration_index >= 0
        y << stack.inject(:+)

        iteration_index = stack.length - 1
        while iteration_index >= 0
          if stack[iteration_index] < range.last
            stack[iteration_index] = (stack[iteration_index].ord + 1).chr
            break
          else
            (iteration_index..stack.length-1).each { |index| stack[index] = range.first }
            iteration_index -= 1
          end
        end
      end
    end
  end

  def self.generate_keys range, length

  end
end

class FileDataReader
  def self.read_data filename
    data = ''
    file = File.new filename, "r"
    while (line = file.gets)
      data += line
    end
    file.close

    data.split(",").map do |stringNumber|
      stringNumber.to_i
    end
  end
end

data = FileDataReader.read_data "cipher1.txt"

max = Enumerator.new do |y|
  (KeyGenerationHelper.generate_keys2 ('a'..'z'), 3).each do |key|
    heuristicValue = (CryptographicHelper.decrypt_array data, key.to_ascii_a).ascii_array_to_s.calculate_trigrams_heuristic
    y << [key, heuristicValue]
  end
end.max_by { |x| x.last }

key = max.first
#line below writes quote from Gospel of John
#puts (CryptographicHelper.decrypt_array data, key.to_ascii_a).ascii_array_to_s
puts (CryptographicHelper.decrypt_array data, key.to_ascii_a).inject(:+)
