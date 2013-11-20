require './max_solution'

# describe "maximum" do

#     # it "should not be for strings, no strings allowed" do
#     # maximum(["bob", "cat", "six"]).should eq(false)
#     # end

#     it "should be an integer" do
#        expect(maximum([2, 6, 6])).to be_kind_of(Integer)
#     end   

#     it "should return the highest number in an array" do
#     maximum([2, 5, 6]).should eq(6)
#     end
# end    
 ""
describe Array, "#maximum" do

    it "should return an integer" do
        expect(Array.new.maximum([3, 4, 3])).to be_a(Integer)
    end
    
    it "should return the highest number in an array" do
        Array.new.maximum([2, 5, 6]).should eq(6)  
    end


end
