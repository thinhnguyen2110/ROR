
# def check_subarray(array,subarray)
#     check_array = []
#     for i in subarray
#         check_array << i if subarray.include?(i)
#     end
#     check_array == subarray
# end 
# array = [5, 1, 22, 26, 6, -1, 8, 10]
# subarray = [1, 6, -1, 10]
# puts check_subarray(array,subarray)

# Dạ cho em hỏi là: em không biết có thể sử dụng subset được không ạ?. Tại em thấy ruby có hỗ trợ và cũng khá ngắn gọn.
require 'set'
def check_subarray(array,subarray)
    subarray.subset?(array)
end
array = Set[5, 1, 22, 26, 6, -1, 8, 10]
subarray = Set[1, 6, -1, 10]
puts check_subarray(array,subarray)

