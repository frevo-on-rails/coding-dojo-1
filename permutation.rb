require 'set'

class Permutation
  
  def permute(*args)
     return Set.new if args.empty?
     args.each do |arg|
       raise ArgumentError unless arg.instance_of?(Array)
     end
     
     return Set.new(combine(args))
  end
  
  protected
  def combine(args)
    return [[]] if args.empty?
    
    tail_combination = combine(args[1..-1])
    
    resulting_combinations = []
    args[0].each do |element|
      tail_combination.each do |combination|
        resulting_combinations.push [element] + combination 
      end 
    end
    
    return resulting_combinations
  end
end