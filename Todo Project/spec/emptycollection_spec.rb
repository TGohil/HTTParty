require 'spec_helper'
require 'date'

describe "Empty Collection Todos Test" do
    
#   ##HTTP Non-Empty
#    before :each do
#        hash = [
#            {title: "Black Ranger", due: Date.today.to_s},
#            {title: "Pink Ranger", due: Date.today.to_s},
#            {title: "Blue Ranger", due: Date.today.to_s},
#            {title: "Yellow Ranger", due: Date.today.to_s},
#            {title: "Red Ranger", due: Date.today.to_s},
#        ]
#        create_todos hash
#    end
    
    after :all do
        delete_all
    end
    
    ## Test 01
    it "should create item with title" do
        title = "Romeo"
        
        r = HTTParty.post url("/todos"),
            query: {title: title}
        
        expect(r.code).to eq(422)
    end
    
    ## Test 02
    it "should create item with due date" do
        due_date = "09-10-2014"
        
        r = HTTParty.post url("/todos"),
            query: {due: due_date}
        
        expect(r.code).to eq(422)
    end
    
    ## Test 03
    it "should post item with title & due date" do
        title = "Romeo"
        due_date = "2014-10-09"
        
        r = HTTParty.post url("/todos"),
            query: {title: title, due: due_date}
        
        expect(r.code).to eq(201)
        expect(r["title"]).to eq(title)
        expect(r["due"]).to eq(due_date)
    end
    
    ## Test 04
    it "should post item with no params" do
        r = HTTParty.post url("/todos"),
            query: {}
        
        expect(r.code).to eq(422)
    end
    
    ## Test 05
    it "GET the collection with nothing inside" do
        r = HTTParty.get url("/todos")
        
        expect(r.code).to eq(200)
    end
    
    ## Test 06
    it "should PUT with no parameters" do        
        r = HTTParty.put url("/todos"),
            query: {}
        
        expect(r.code).to eq(405)
    end
    
    ## Test 07
    it "should DELETE with no parameters" do        
        r = HTTParty.delete url("/todos"),
            query: {}
        
        expect(r.code).to eq(405)
    end
    
    
end