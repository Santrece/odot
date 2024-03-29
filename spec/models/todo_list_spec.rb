require 'spec_helper'

describe TodoList do
  it { should have_many(:todo_items)}

  describe "#has_completed_items?" do
    let(:todo_list) { TodoList.create (title: "Groceries", description: "Grocery List")}

    it "returns true with completed todo list items" do 
      todo_list.todo_items.create(content: "white rice", completed_at: 1.minute.ago)
      expect(todo_list.has_completed_items?).to be_true
    end  

    it "returns false with no completed todo list items" do
      todo_list.todo_items.create(content: "white rice")
      expect(todo_list.has_completed_items?).to be_false   
    end  
  end 

  describe "#has_incomplete_items?" do
    let(:todo_list) {TodoList.create(title: "Groceries", description:"Grocery List")}

    it "returns true with incompleted todo list items" do
      todo_list.todo_items.create(content: "white rice")
      expect(todo_list.has_incomplete_items?).to be_true
    end  

    it "returns false with no incomplete todo list items" do
      todo_list.todo_items.create(content: "white rice",completed_at: 1.minute.ago)
      expect(todo_list.has_incomplete_items?).to be_false
    end  
  end 
end
