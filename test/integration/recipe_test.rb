require 'test_helper'

class RecipeFlowsTest < ActionDispatch::IntegrationTest
  fixtures :recipes
  test 'create recipes' do
    curry = recipes(:curry)
    get '/recipes/new'
    assert_response :success
    post_via_redirect '/recipes/new', title: recipes(:curry).title
    assert_equal '/recipes', path
    assert_equal 'Create Recipe', flash[:notice]

    get '/recipes'
    assert_response :success
    assert_assigns(:recipes)
  end
end
