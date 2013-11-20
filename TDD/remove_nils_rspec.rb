require './remove_nils_solution'

describe "#sum" do
    it "should not raise an error" do
        expect(sum).to_not raise_error 
    end

     it "should be an integer" do
        expect(sum).to be_kind_of(Integer)
    end   

end        
