def search_triplet(arays, target)
  arrays_triplet = arays.combination(3).to_a
  result = []
  for i in arrays_triplet
    total = i.reduce { |sum, number| sum + number }
    result << i if total == target
  end
  return result
end 
p search_triplet([12, 3, 1, 2, -6, 5, -8, 6],0) 