require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @task = @user.tasks.build(title: "Test 1", description: "Lorem ipsum")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end

  test "task title should be present" do
    @task.title = "   "
    assert_not @task.valid?
  end

  test "task title should be at most 140 characters" do
    @task.title = "a" * 141
    assert_not @task.valid?
  end

  test "order should be most recent first" do
    assert_equal tasks(:most_recent), Task.first
  end
end
