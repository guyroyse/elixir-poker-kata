defmodule HandRankTest do
  use ExUnit.Case

  test "it compares ranks that are greater than" do
    assert HandRank.compare(HandRank.five_of_a_kind, HandRank.royal_flush) == :gt
    assert HandRank.compare(HandRank.royal_flush, HandRank.straight_flush) == :gt
    assert HandRank.compare(HandRank.straight_flush, HandRank.four_of_a_kind) == :gt
    assert HandRank.compare(HandRank.four_of_a_kind, HandRank.full_house) == :gt
    assert HandRank.compare(HandRank.full_house, HandRank.flush) == :gt
    assert HandRank.compare(HandRank.flush, HandRank.straight) == :gt
    assert HandRank.compare(HandRank.straight, HandRank.three_of_a_kind) == :gt
    assert HandRank.compare(HandRank.three_of_a_kind, HandRank.two_pair) == :gt
    assert HandRank.compare(HandRank.two_pair, HandRank.pair) == :gt
    assert HandRank.compare(HandRank.pair, HandRank.high_card) == :gt
  end

  test "it compares ranks that are less than" do
    assert HandRank.compare(HandRank.royal_flush, HandRank.five_of_a_kind) == :lt
    assert HandRank.compare(HandRank.straight_flush, HandRank.royal_flush) == :lt
    assert HandRank.compare(HandRank.four_of_a_kind, HandRank.straight_flush) == :lt
    assert HandRank.compare(HandRank.full_house, HandRank.four_of_a_kind) == :lt
    assert HandRank.compare(HandRank.flush, HandRank.full_house) == :lt
    assert HandRank.compare(HandRank.straight, HandRank.flush) == :lt
    assert HandRank.compare(HandRank.three_of_a_kind, HandRank.straight) == :lt
    assert HandRank.compare(HandRank.two_pair, HandRank.three_of_a_kind) == :lt
    assert HandRank.compare(HandRank.pair, HandRank.two_pair) == :lt
    assert HandRank.compare(HandRank.high_card, HandRank.pair) == :lt
  end

  test "it compares ranks that are equal" do
    assert HandRank.compare(HandRank.five_of_a_kind, HandRank.five_of_a_kind) == :eq
    assert HandRank.compare(HandRank.royal_flush, HandRank.royal_flush) == :eq
    assert HandRank.compare(HandRank.straight_flush, HandRank.straight_flush) == :eq
    assert HandRank.compare(HandRank.four_of_a_kind, HandRank.four_of_a_kind) == :eq
    assert HandRank.compare(HandRank.full_house, HandRank.full_house) == :eq
    assert HandRank.compare(HandRank.flush, HandRank.flush) == :eq
    assert HandRank.compare(HandRank.straight, HandRank.straight) == :eq
    assert HandRank.compare(HandRank.three_of_a_kind, HandRank.three_of_a_kind) == :eq
    assert HandRank.compare(HandRank.two_pair, HandRank.two_pair) == :eq
    assert HandRank.compare(HandRank.pair, HandRank.pair) == :eq
    assert HandRank.compare(HandRank.high_card, HandRank.high_card) == :eq
  end

  test "it turns hand ranks into strings" do
    assert HandRank.to_string(HandRank.five_of_a_kind) == "Five of a Kind"
    assert HandRank.to_string(HandRank.royal_flush) == "Royal Flush"
    assert HandRank.to_string(HandRank.straight_flush) == "Straight Flush"
    assert HandRank.to_string(HandRank.four_of_a_kind) == "Four of a Kind"
    assert HandRank.to_string(HandRank.full_house) == "Full House"
    assert HandRank.to_string(HandRank.flush) == "Flush"
    assert HandRank.to_string(HandRank.straight) == "Straight"
    assert HandRank.to_string(HandRank.three_of_a_kind) == "Three of a Kind"
    assert HandRank.to_string(HandRank.two_pair) == "Two Pair"
    assert HandRank.to_string(HandRank.pair) == "Pair"
    assert HandRank.to_string(HandRank.high_card) == "High Card"
  end

end
