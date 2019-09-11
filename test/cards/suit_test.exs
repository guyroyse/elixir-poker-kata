defmodule SuiteTest do
  use ExUnit.Case

  test "it compares suits that are greater than" do
    assert Suit.compare(Suit.spades, Suit.hearts) == :gt
    assert Suit.compare(Suit.hearts, Suit.clubs) == :gt
    assert Suit.compare(Suit.clubs, Suit.diamonds) == :gt
  end

  test "it compares suits that are less than" do
    assert Suit.compare(Suit.hearts, Suit.spades) == :lt
    assert Suit.compare(Suit.clubs, Suit.hearts) == :lt
    assert Suit.compare(Suit.diamonds, Suit.clubs) == :lt
  end

  test "it compares suits that are equal" do
    assert Suit.compare(Suit.spades, Suit.spades) == :eq
    assert Suit.compare(Suit.hearts, Suit.hearts) == :eq
    assert Suit.compare(Suit.clubs, Suit.clubs) == :eq
    assert Suit.compare(Suit.diamonds, Suit.diamonds) == :eq
  end

  test "it turns suits into strings" do
    assert Suit.to_string(Suit.spades) == "♠︎"
    assert Suit.to_string(Suit.hearts) == "♥"
    assert Suit.to_string(Suit.clubs) == "♣︎"
    assert Suit.to_string(Suit.diamonds) == "♦"
  end

end
