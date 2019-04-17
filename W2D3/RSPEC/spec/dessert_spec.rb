require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) { Dessert.new("brownie", 50 , "Jim") }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end
     
    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
     expect {Dessert.new("brownie , tons")}.to raise_error()
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
    brownie.add_ingredient("chocolate")
    expect(brownie.add_ingredient).to include("chocolate")
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
  ingredients = ["choclate", "sugar", "your_mom"]
  ingredients.each do |ingredient|
    brownie.add_ingredient(ingredient)
  end

  expect(brownie.ingredient).to eq(ingredients)
  brownie.mix
  expect(brownie.ingredient).not_to eq(ingredients)
  in

  end

  describe "#eat" do
    it "subtracts an amount from the quantity"
    brownie.eat(20)
    expect(brownie.quantity).to eq(30)

    it "raises an error if the amount is greater than the quantity"
    expect {brownie.eat(52)}.to raise_error()
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
    brownie.serve
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
