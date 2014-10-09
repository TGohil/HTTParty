require 'spec_helper'
require 'date'

describe "Empty Collection Todos Test" do
    before :each do
        hash = [
            {title: "Black Ranger", due: Date.today.to_s},
            {title: "Pink Ranger", due: Date.today.to_s},
            {title: "Blue Ranger", due: Date.today.to_s},
            {title: "Yellow Ranger", due: Date.today.to_s},
            {title: "Red Ranger", due: Date.today.to_s},
        ]
        create_todos hash
    end
    
    after :all do
        delete_all
    end
    
    ## Test 01
    it "should GET the collection" do
        title = "Romeo"
        
        r = HTTParty.get url("/todos")
        
        expect(r.code).to eq(200)
    end
end