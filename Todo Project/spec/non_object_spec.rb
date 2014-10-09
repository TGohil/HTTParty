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
    it "should GET the collection" do
        
        r = HTTParty.get url("/todos/1")
        
        expect(r.code).to eq(404)
    end
    
    ## Test 02
    it "should POST parameters to the collection" do
        title = "aaron"
        due_date = "1991-07-21"
        
        r = HTTParty.post url("/todos/1")
        
        expect(r.code).to eq(405)
    end
    
    ## Test 03
    it "should POST with no parameters" do
        r = HTTParty.post url("/todos/1")
        
        expect(r.code).to eq(405)
    end
    
    ## Test 04
    it "should PUT with no parameters" do
        
        r = HTTParty.put url("/todos/1")
        
        expect(r.code).to eq(422)
    end
    
    ## Test 05
    it "should GET the collection" do
        
        r = HTTParty.get url("/todos/1")
        
        expect(r.code).to eq(404)
    end
    
    ## Test 06
    it "should DELETE with no parameters" do
        
        r = HTTParty.delete url("/todos/1")
        
        expect(r.code).to eq(404)
    end
end