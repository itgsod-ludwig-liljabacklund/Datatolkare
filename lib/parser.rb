#def main(path)
#  allarray = load_weather_file(path)
#  lines = File.foreach(path).count
#  i = 0
#  @array = []
#  while i < lines
#    p allarray[i]
#    product = split_line(allarray[i])
#    @array << encode_line(product)
#    i += 1
#  end
#  product = find_biggest_variation(@array)
#  puts "Day #{product[0]} had the biggest variaton (#{product[1]})"
#end
#
#def load_weather_file(path)
#  raise ArgumentError, "path must not be empty" if path == ""
#  raise IOError, "file does not exist" unless File.exist?(path)
#  f = File.open(path, "r")
#  i = 0
#  rowarray = []
#  f.each_line do |line|
#    rowarray << line if i >= 2
#    i += 1
#  end
#  return rowarray
#end
#
#def split_line(input)
#  raise ArgumentError, "can not parse empty line" if input == ""
#  input = input.split(" ")
#  return input
#end
#
#def encode_line(array)
#  raise ArgumentError, "incomplete array" if array.length < 3
#  products = { :date => array[0].to_i, :max => array[1].to_i, :min => array[2].to_i }
#  return products
#end
#
#def find_biggest_variation(hasharray)
#  raise ArgumentError, "array must not be empty" if hasharray == []
#  difference = 0
#  hasharray.each_with_index do |item, index|
#    if item[:max] - item[:min] > difference
#      difference = item[:max] - item[:min]
#      @hashindex = index
#    end
#  end
#  return hasharray[@hashindex]
#end
#
##main("../spec/test.dat")
def main(input)
  hashes = []
  rows = load_weather_file(input)
  rows.each do |object|
    result = split_line(object)
    hashes << encode_line(result)
  end
  hash = find_biggest_variation(hashes)
  puts "Day #{hash[:date]} had the biggest variation (#{hash[:max] - hash[:min]} degrees)"
end

def split_line(input)
  raise ArgumentError, "can not parse empty line" if input == ""
  output = input.split(" ")
  return output
end

def encode_line(input)
  raise ArgumentError, "incomplete array" if input.length < 3
  hash = {:date => input[0].to_i, :max => input[1].to_i, :min => input[2].to_i}
  return hash
end

def find_biggest_variation(input)
  raise ArgumentError, "array must not be empty" if input == []
  difference = 0
  i = 0
  input.each_with_index do |hash, index|
    if hash[:max] - hash[:min] > difference
      difference = hash[:max] - hash[:min]
      i = index
    end
  end
  return input[i]
end

def load_weather_file(input)
  raise ArgumentError if input == ""
  raise ArgumentError, "path must not be empty" if input == "''"
  raise IOError, "file does not exist" unless File.exist?(input)
  f = File.readlines(input)
  f = f.drop(2)
  return f
end

p main('../weather.dat')