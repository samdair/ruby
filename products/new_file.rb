def solution(pairs)
  pairs.each do |x,y| 
  print "#{x} = #{y}".join(',')
  end
end
puts solution({"a"=>1,"b"=>2})