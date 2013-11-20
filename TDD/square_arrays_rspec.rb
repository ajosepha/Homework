require './square_arrays_solution'

describe "#square_array" do
    it "should return an array" do
        expect(square_array([1, 3, 4])).to be_a(Array)
    end

    it "should return the square of each item in the array" do
        expect(square_array([2, 4])).to eq([4, 16])
    end    

end         