# 실행: iex -S mix
# 종료 없이 재컴파일: recompile
# Enum 컬랙션 라이브러리
# 자동 정렬: shift option f
# mix deps.get 의존성 추가
defmodule Cards do
  def hello do
    "Hello World!"
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # 패턴 매칭  {hand, rest_of_deck} = Cards.deal(deck, 5)
  # color1 = ["red"]
  # [color1] = ["red"]
  # [color1, color2] = ["red", "blue"]
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  # {status, binary} = File.read("my_deck")
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"   #_reason, 변수가 있다는 것을 알지만 사용하지 않겠다라는 의미.
    end
  end

  def create_hand(hand_size) do
   # deck = Cards.create_deck()
   # deck = Cards.shuffle(deck)
   # hand = Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
