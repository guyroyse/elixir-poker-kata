defmodule RankTest do
  use ExUnit.Case

  test "it compares ranks that are greater than" do
    assert Rank.compare(Rank.ace, Rank.king) == :gt
    assert Rank.compare(Rank.king, Rank.queen) == :gt
    assert Rank.compare(Rank.queen, Rank.jack) == :gt
    assert Rank.compare(Rank.jack, Rank.ten) == :gt
    assert Rank.compare(Rank.ten, Rank.nine) == :gt
    assert Rank.compare(Rank.nine, Rank.eight) == :gt
    assert Rank.compare(Rank.eight, Rank.seven) == :gt
    assert Rank.compare(Rank.seven, Rank.six) == :gt
    assert Rank.compare(Rank.six, Rank.five) == :gt
    assert Rank.compare(Rank.five, Rank.four) == :gt
    assert Rank.compare(Rank.four, Rank.three) == :gt
    assert Rank.compare(Rank.three, Rank.two) == :gt
  end

  test "it compares ranks that are less than" do
    assert Rank.compare(Rank.king, Rank.ace) == :lt
    assert Rank.compare(Rank.queen, Rank.king) == :lt
    assert Rank.compare(Rank.jack, Rank.queen) == :lt
    assert Rank.compare(Rank.ten, Rank.jack) == :lt
    assert Rank.compare(Rank.nine, Rank.ten) == :lt
    assert Rank.compare(Rank.eight, Rank.nine) == :lt
    assert Rank.compare(Rank.seven, Rank.eight) == :lt
    assert Rank.compare(Rank.six, Rank.seven) == :lt
    assert Rank.compare(Rank.five, Rank.six) == :lt
    assert Rank.compare(Rank.four, Rank.five) == :lt
    assert Rank.compare(Rank.three, Rank.four) == :lt
    assert Rank.compare(Rank.two, Rank.three) == :lt
  end

  test "it compares ranks that are equal" do
    assert Rank.compare(Rank.ace, Rank.ace) == :eq
    assert Rank.compare(Rank.king, Rank.king) == :eq
    assert Rank.compare(Rank.queen, Rank.queen) == :eq
    assert Rank.compare(Rank.jack, Rank.jack) == :eq
    assert Rank.compare(Rank.ten, Rank.ten) == :eq
    assert Rank.compare(Rank.nine, Rank.nine) == :eq
    assert Rank.compare(Rank.eight, Rank.eight) == :eq
    assert Rank.compare(Rank.seven, Rank.seven) == :eq
    assert Rank.compare(Rank.six, Rank.six) == :eq
    assert Rank.compare(Rank.five, Rank.five) == :eq
    assert Rank.compare(Rank.four, Rank.four) == :eq
    assert Rank.compare(Rank.three, Rank.three) == :eq
    assert Rank.compare(Rank.two, Rank.two) == :eq
  end

  test "it turns ranks into strings" do
    assert Rank.to_string(Rank.ace) == "A"
    assert Rank.to_string(Rank.king) == "K"
    assert Rank.to_string(Rank.queen) == "Q"
    assert Rank.to_string(Rank.jack) == "J"
    assert Rank.to_string(Rank.ten) == "10"
    assert Rank.to_string(Rank.nine) == "9"
    assert Rank.to_string(Rank.eight) == "8"
    assert Rank.to_string(Rank.seven) == "7"
    assert Rank.to_string(Rank.six) == "6"
    assert Rank.to_string(Rank.five) == "5"
    assert Rank.to_string(Rank.four) == "4"
    assert Rank.to_string(Rank.three) == "3"
    assert Rank.to_string(Rank.two) == "2"
  end

end
