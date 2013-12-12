require './green_grocer'

describe "#clearance" do
    it "should put clerance items in a new array" do
        clearance([{"BEETS"=>{:price=>2.5, :clearance=>false}}]).to eq(nil)
    end
end        
