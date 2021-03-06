require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  #Test for required associations
  test "membership requires group" do
    blank = Membership.new()
    assert !blank.valid?

    m = Membership.new({:user => users(:kristen)})
    assert !m.valid?, "Membership doesn't have group"
    m.group = groups(:wtg)
    assert m.valid?, "Membership has group"
  end
  test "membership requires user" do
    m = Membership.new({:group => groups(:wtg)})
    assert !m.valid?, "Membership doesn't have user"
    m.user = users(:kristen)
    assert m.valid?, "Membership has user"
  end
  
  #Test for uniqueness
  test "membership cannot duplicate" do
    m = Membership.new({:user => users(:katie), :group => groups(:wtg)})
    assert !m.valid?, "Membership already exists"
    m.user = users(:kristen)
    assert m.valid?, "Membership is unique"
  end

  #Test scoping for leader/regular
  test "leader scope" do
    m = memberships(:katie_wtg)
    leader = Membership.leader.all
    assert m.is_leader, "Membership is leader"
    assert_equal leader.length, 1, "Only 1 leader"
    assert_equal leader.first, m, "Membership matches leader"
  end
  test "regular scope" do
    m = memberships(:katie_rpitv)
    regular = Membership.regular.all
    assert !m.is_leader, "Membership is not leader"
    assert_equal regular.length, 1, "Only 1 regular"
    assert_equal regular.first, m, "Membership matches regular"
  end

end
