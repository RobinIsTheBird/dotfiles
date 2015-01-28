/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stringplayingcards;


/**
 *
 * @author robinschaufler
 */
public class PlayingCard implements Comparable<PlayingCard> {
    private final PlayingCardSuit suit;
    private final PlayingCardRank rank;
    private Integer cardOrdinal;
    public static final Integer MAX_ORDINAL = calculateOrdinal(PlayingCardSuit.MAXIMUM, PlayingCardRank.MAXIMUM);
    
    public static Integer calculateOrdinal(Integer suitNumber, Integer rankValue) {
        return (suitNumber - 1) * (PlayingCardRank.MAXIMUM - 1) + (rankValue - 2);
    }
    public PlayingCard(PlayingCardSuit suit, PlayingCardRank rank) {
        this.suit = suit;
        this.rank = rank;
        cardOrdinal = calculateOrdinal(suit.getSuitNumber(), rank.getValue());
    }
    public PlayingCard(String suit, PlayingCardRank rank) {
        this(new PlayingCardSuit(suit), rank);
    }
    public PlayingCard(Integer suit, PlayingCardRank rank) {
        this(new PlayingCardSuit(suit), rank);
    }
    public PlayingCard(PlayingCardSuit suit, String rank) {
        this(suit, new PlayingCardRank(rank));
    }
    public PlayingCard(PlayingCardSuit suit, Integer rank) {
        this(suit, new PlayingCardRank(rank));
    }
    public PlayingCard(String suit, String rank) {
        this(new PlayingCardSuit(suit), new PlayingCardRank(rank));
    }
    public PlayingCard(String suit, Integer rank) {
        this(new PlayingCardSuit(suit), new PlayingCardRank(rank));
    }
    public PlayingCard(Integer suit, String rank) {
        this(new PlayingCardSuit(suit), new PlayingCardRank(rank));
    }
    public PlayingCard(Integer suit, Integer rank) {
        this(new PlayingCardSuit(suit), new PlayingCardRank(rank));
    }
    public PlayingCardSuit getSuit() {
        return suit;
    }
    public PlayingCardRank getRank() {
        return rank;
    }
    public Integer getOrdinal() {
        return cardOrdinal;
    }
    @Override
    public String toString() {
        return rank.toString() + " of " + suit.toString();
    }
    public boolean equals(PlayingCard other) {
        return suit.equals(other.suit) && rank.equals(other.rank);
    }
    @Override
    public boolean equals(Object o) {
        if (!(o instanceof PlayingCard)) {
            throw new UnsupportedOperationException(
                    "PlayingCard can only compare to PlayingCard.");
        }
        return equals((PlayingCard)o);
    }
    @Override
    public int compareTo(PlayingCard other) {
        int comparison = suit.compareTo(other.suit);
        if (0 == comparison) {
            comparison = rank.compareTo(other.rank);
        }
        return comparison;
    }
    @Override
    public int hashCode() {
        return cardOrdinal.hashCode();
    }
}
