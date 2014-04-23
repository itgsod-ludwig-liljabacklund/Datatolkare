require 'rspec'
require 'stringio'
require_relative '../lib/parser'


describe 'split_line' do

  before do
    @example_input1 = "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5\n"
    @example_output1 = ["1", "88", "59", "74", "53.8", "0.00", "F", "280", "9.6", "270", "17", "1.6", "93", "23", "1004.5"]
  end

  it 'should take a string as argument' do
    expect { split_line() }.to raise_error ArgumentError
  end

  # Detta test kan kommenteras bort om man inte vill testa 'Undantagshantering' på C- eller A-nivå
  it 'should raise ArgumentError with correct error message if fed a blank line' do
    expect { split_line('') }.to raise_error ArgumentError, 'can not parse empty line'
  end

  it 'should return an array' do
    split_line(@example_input1).should be_instance_of Array
  end

  it 'should return an array with each value in its own field' do
    split_line(@example_input1).should match_array @example_output1
  end
end

describe 'encode_line' do

  before do
    @example_array = ["1", "88", "59", "74", "53.8", "0.00", "F", "280", "9.6", "270", "17", "1.6", "93", "23", "1004.5"]
    @example_hash = { date: 1, max: 88, min: 59 }
  end

  it 'should take an array as argument' do
    expect { encode_line() }.to raise_error ArgumentError
  end

  #Detta test kan kommenteras bort om man inte vill testa 'Undantagshantering' på C- eller A-nivå
  it 'should raise ArgumentError with correct message if array is too short' do
    expect { encode_line([1,2]) }.to raise_error ArgumentError, 'incomplete array'
  end

  it 'should return a hash with the correct keys' do
    encode_line(@example_array).keys.should match_array [:date, :max, :min]
  end

  it 'should return the array correctly encoded as a hash' do
    encode_line(@example_array).should == @example_hash
  end

end

describe 'find_biggest_variation' do

  it 'should take an array of hashes as argument' do
    expect { find_biggest_variation() }.to raise_error ArgumentError
  end

  #Detta test kan kommenteras bort om man inte vill testa 'Undantagshantering' på C- eller A-nivå
  it 'should raise ArgumentError with correct message if array is empty' do
    expect { find_biggest_variation([]) }.to raise_error ArgumentError, 'array must not be empty'
  end

  it 'should return the hash for the day with the biggest variation' do
    example_array = [{ date: 1, max: 88, min: 59 }, { date: 2, max: 88, min: 53 }, { date: 3, max: 88, min: 67 } ]
    find_biggest_variation(example_array).should == { date: 2, max: 88, min: 53}
  end

end

describe 'load_weather_file' do

  it 'should take a string as argument' do
    expect { load_weather_file() }.to raise_error ArgumentError
  end

  #Detta test kan kommenteras bort om man inte vill testa 'Undantagshantering' på C- eller A-nivå
  it 'should raise ArgumentError with correct message if string is empty' do
    expect { load_weather_file('') }.to raise_error ArgumentError, 'path must not be empty'
  end

  #Detta test kan kommenteras bort om man inte vill testa 'Undantagshantering' på C- eller A-nivå
  it 'should raise IOError with correct message if file does not exist' do
    expect { load_weather_file('nonexisting.file') }.to raise_error IOError, 'file does not exist'
  end

  it 'should read the file and return an array of all rows in the file EXCEPT the first two' do
    load_weather_file('spec/test.dat').should == ["   1  88    67    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5\n", "   2  87    61    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5\n", "   3  83    72    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8"]
  end

end

describe 'main' do

  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  it 'should print the day with the biggest variation' do
    main('spec/test.dat')
    $stdout.string.should == "Day 2 had the biggest variation (26.0 degrees)\n"
  end

end
