require_relative "../test_helper"

describe HashDelegate do
  class DummyClass < Struct.new(:data)
    extend HashDelegate
    hash_delegate :size, :color, to: :data
  end

  it "adds the getters to the delegated keys" do
    object = DummyClass.new color: "blue", size: "sm"

    assert_equal object.color, "blue"
    assert_equal object.size, "sm"
  end

  it "returns nil for if the delegated key is not set" do
    object = DummyClass.new

    assert_equal object.color, nil
    assert_equal object.size, nil
  end

  it "allow to set a value through delegation" do
    object = DummyClass.new
    object.color = "green"
    object.size = "lg"

    assert_equal object.color, "green"
    assert_equal object.size, "lg"
  end

  it "does not add getters to keys that where not delegated" do
    object = DummyClass.new name: "projects"

    refute_respond_to object, :name
  end
end
