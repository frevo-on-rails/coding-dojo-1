require 'rubygems'
require 'shoulda'
require  'permutacao'
require 'set'

class PermutationTest < Test::Unit::TestCase
   context  "A permutation class" do
      setup do
        @permutation = Permutation.new
      end
      
      should "return empty set when receive nothing" do
        assert_equal Set.new, @permutation.permute  
      end
      
      should "return the same element when receive one element" do
        array =  [1]
        
        assert_equal Set.new([[1]]), @permutation.permute(array)
      end
      
      should "thrown error when receive a non-array element" do
        assert_raise ArgumentError do
          @permutation.permute 1
        end
      end
      
      should "permute correctly when receive two lists" do
        array1 = [1,2]
        array2 = [3,4]
        
        assert_equal Set.new( [[1,3],[1,4],[2,3],[2,4]]), @permutation.permute(array1, array2)
      end
      
      should "permute correctly when receive (n) lists" do
        array1 = [1,2]
        array2 = [3,4]
        array3 = [5,6,7]
        assert_equal Set.new([[1,3,5],[1,3,6],[1,3,7],
          [1,4,5],[1,4,6],[1,4,7],
          [2,3,5],[2,3,6],[2,3,7],
          [2,4,5],[2,4,6],[2,4,7]]), @permutation.permute(array1, array2, array3)
      end
   end
      
  
end  