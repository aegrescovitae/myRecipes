require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "this is the best chicken parm recipe ever", description: "heat pan, add butter, and chicken, add parm, cook that shit aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  end
  
  test "recipe should be vaild" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name must not be too short" do
    @recipe.name = "aa"
    assert_not @recipe.valid?
  end
  
  test "name must no be too long" do
    @recipe.name = "a" * 105
    assert_not @recipe.valid?
  end
  
  test "summary must be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary must not be too short" do
    @recipe.summary = "aa"
    assert_not @recipe.valid?
  end
  
  test "summary must not be too long" do
   @recipe.summary = "a" * 1001
   assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description must not be too short" do
    @recipe.description = "a" 
    assert_not @recipe.valid?
  end
  
  test "description must not be too long" do
    @recipe.description = "a" * 2001
    assert_not @recipe.valid?
  end
  
  
  
end