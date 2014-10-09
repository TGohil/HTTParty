require 'spec_helper'
require 'date'

describe "Non-existng objects within collection" do
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
    it "should GET the first item" do
        
        r = HTTParty.get url("/todos/" + todo["id"].to_s)
        
        expect(r.code).to eq(200)
    end
end