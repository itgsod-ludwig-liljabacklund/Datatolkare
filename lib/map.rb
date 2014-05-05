example_array = ["1", "88", "59", "74", "53.8", "0.00", "F", "280", "9.6", "270", "17", "1.6", "93", "23", "1004.5"]



new2 = example_array.map {|item| encode_line(item)}
new3 = example_array.select {|item| item.to_i > 10}