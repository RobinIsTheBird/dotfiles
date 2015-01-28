/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enumplayingcards;

/**
 *
 * @author robinschaufler
 */
public enum PlayingCard {
    DEUCE_OF_CLUBS(PlayingCardRankEnum.DEUCE, PlayingCardSuitEnum.CLUBS),
    THREE_OF_CLUBS(PlayingCardRankEnum.THREE, PlayingCardSuitEnum.CLUBS),
    FOUR_OF_CLUBS(PlayingCardRankEnum.FOUR, PlayingCardSuitEnum.CLUBS),
    FIVE_OF_CLUBS(PlayingCardRankEnum.FIVE, PlayingCardSuitEnum.CLUBS),
    SIX_OF_CLUBS(PlayingCardRankEnum.SIX, PlayingCardSuitEnum.CLUBS),
    SEVEN_OF_CLUBS(PlayingCardRankEnum.SEVEN, PlayingCardSuitEnum.CLUBS),
    EIGHT_OF_CLUBS(PlayingCardRankEnum.EIGHT, PlayingCardSuitEnum.CLUBS),
    NINE_OF_CLUBS(PlayingCardRankEnum.NINE, PlayingCardSuitEnum.CLUBS),
    TEN_OF_CLUBS(PlayingCardRankEnum.TEN, PlayingCardSuitEnum.CLUBS),
    JACK_OF_CLUBS(PlayingCardRankEnum.JACK, PlayingCardSuitEnum.CLUBS),
    QUEEN_OF_CLUBS(PlayingCardRankEnum.QUEEN, PlayingCardSuitEnum.CLUBS),
    KING_OF_CLUBS(PlayingCardRankEnum.KING, PlayingCardSuitEnum.CLUBS),
    ACE_OF_CLUBS(PlayingCardRankEnum.ACE, PlayingCardSuitEnum.CLUBS),
    
    DEUCE_OF_DIAMONDS(PlayingCardRankEnum.DEUCE, PlayingCardSuitEnum.DIAMONDS),
    THREE_OF_DIAMONDS(PlayingCardRankEnum.THREE, PlayingCardSuitEnum.DIAMONDS),
    FOUR_OF_DIAMONDS(PlayingCardRankEnum.FOUR, PlayingCardSuitEnum.DIAMONDS),
    FIVE_OF_DIAMONDS(PlayingCardRankEnum.FIVE, PlayingCardSuitEnum.DIAMONDS),
    SIX_OF_DIAMONDS(PlayingCardRankEnum.SIX, PlayingCardSuitEnum.DIAMONDS),
    SEVEN_OF_DIAMONDS(PlayingCardRankEnum.SEVEN, PlayingCardSuitEnum.DIAMONDS),
    EIGHT_OF_DIAMONDS(PlayingCardRankEnum.EIGHT, PlayingCardSuitEnum.DIAMONDS),
    NINE_OF_DIAMONDS(PlayingCardRankEnum.NINE, PlayingCardSuitEnum.DIAMONDS),
    TEN_OF_DIAMONDS(PlayingCardRankEnum.TEN, PlayingCardSuitEnum.DIAMONDS),
    JACK_OF_DIAMONDS(PlayingCardRankEnum.JACK, PlayingCardSuitEnum.DIAMONDS),
    QUEEN_OF_DIAMONDS(PlayingCardRankEnum.QUEEN, PlayingCardSuitEnum.DIAMONDS),
    KING_OF_DIAMONDS(PlayingCardRankEnum.KING, PlayingCardSuitEnum.DIAMONDS),
    ACE_OF_DIAMONDS(PlayingCardRankEnum.ACE, PlayingCardSuitEnum.DIAMONDS),
    
    DEUCE_OF_HEARTS(PlayingCardRankEnum.DEUCE, PlayingCardSuitEnum.HEARTS),
    THREE_OF_HEARTS(PlayingCardRankEnum.THREE, PlayingCardSuitEnum.HEARTS),
    FOUR_OF_HEARTS(PlayingCardRankEnum.FOUR, PlayingCardSuitEnum.HEARTS),
    FIVE_OF_HEARTS(PlayingCardRankEnum.FIVE, PlayingCardSuitEnum.HEARTS),
    SIX_OF_HEARTS(PlayingCardRankEnum.SIX, PlayingCardSuitEnum.HEARTS),
    SEVEN_OF_HEARTS(PlayingCardRankEnum.SEVEN, PlayingCardSuitEnum.HEARTS),
    EIGHT_OF_HEARTS(PlayingCardRankEnum.EIGHT, PlayingCardSuitEnum.HEARTS),
    NINE_OF_HEARTS(PlayingCardRankEnum.NINE, PlayingCardSuitEnum.HEARTS),
    TEN_OF_HEARTS(PlayingCardRankEnum.TEN, PlayingCardSuitEnum.HEARTS),
    JACK_OF_HEARTS(PlayingCardRankEnum.JACK, PlayingCardSuitEnum.HEARTS),
    QUEEN_OF_HEARTS(PlayingCardRankEnum.QUEEN, PlayingCardSuitEnum.HEARTS),
    KING_OF_HEARTS(PlayingCardRankEnum.KING, PlayingCardSuitEnum.HEARTS),
    ACE_OF_HEARTS(PlayingCardRankEnum.ACE, PlayingCardSuitEnum.HEARTS),
    
    DEUCE_OF_SPADES(PlayingCardRankEnum.DEUCE, PlayingCardSuitEnum.SPADES),
    THREE_OF_SPADES(PlayingCardRankEnum.THREE, PlayingCardSuitEnum.SPADES),
    FOUR_OF_SPADES(PlayingCardRankEnum.FOUR, PlayingCardSuitEnum.SPADES),
    FIVE_OF_SPADES(PlayingCardRankEnum.FIVE, PlayingCardSuitEnum.SPADES),
    SIX_OF_SPADES(PlayingCardRankEnum.SIX, PlayingCardSuitEnum.SPADES),
    SEVEN_OF_SPADES(PlayingCardRankEnum.SEVEN, PlayingCardSuitEnum.SPADES),
    EIGHT_OF_SPADES(PlayingCardRankEnum.EIGHT, PlayingCardSuitEnum.SPADES),
    NINE_OF_SPADES(PlayingCardRankEnum.NINE, PlayingCardSuitEnum.SPADES),
    TEN_OF_SPADES(PlayingCardRankEnum.TEN, PlayingCardSuitEnum.SPADES),
    JACK_OF_SPADES(PlayingCardRankEnum.JACK, PlayingCardSuitEnum.SPADES),
    QUEEN_OF_SPADES(PlayingCardRankEnum.QUEEN, PlayingCardSuitEnum.SPADES),
    KING_OF_SPADES(PlayingCardRankEnum.KING, PlayingCardSuitEnum.SPADES),
    ACE_OF_SPADES(PlayingCardRankEnum.ACE, PlayingCardSuitEnum.SPADES),
    
    JOKER1(PlayingCardRankEnum.DEUCE, PlayingCardSuitEnum.JOKER),
    JOKER2(PlayingCardRankEnum.ACE, PlayingCardSuitEnum.JOKER);
    
    private final PlayingCardRankEnum rank;
    private final PlayingCardSuitEnum suit;
    
    PlayingCard(PlayingCardRankEnum inputRank, PlayingCardSuitEnum inputSuit) {
        
        if (inputSuit.equals(PlayingCardSuitEnum.JOKER) &&
                !(inputRank.equals(PlayingCardRankEnum.ACE)  || inputRank.equals(PlayingCardRankEnum.DEUCE))) {
            throw new UnsupportedOperationException("Only two Joker ranks allowed");
        }
        rank = inputRank;
        suit = inputSuit;
    }
    
    public PlayingCardRankEnum getRank() {
        return rank;
    }
    
    public PlayingCardSuitEnum getSuit() {
        return suit;
    }
    
    public Boolean isJoker() {
        return suit.equals(PlayingCardSuitEnum.JOKER);
    }
    
    public boolean equals(PlayingCard other) {
        return rank.equals(other.rank) && suit.equals(other.suit);
    }
    
    public boolean ties(PlayingCard other) {
        if (suit.equals(PlayingCardSuitEnum.JOKER) && other.suit.equals(PlayingCardSuitEnum.JOKER)) {
            return true;
        }
        return equals(other);
    }
    
    public boolean beats(PlayingCard other) {
        if (suit.equals(PlayingCardSuitEnum.JOKER) && other.suit.equals(PlayingCardSuitEnum.JOKER)) {
            return true;
        }
        return 1 == compareTo(other);
    }
    
    public Boolean isFace() {
        return rank.isFace();
    }
    
    public PlayingCardColorEnum getColor() {
        return suit.getColor();
    }
    
    @Override
    public String toString() {
        if (isJoker()) {
            return String.format("%s", suit);
        }
        return String.format("%s of %s", rank, suit);
    }
}
