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
public class PlayingCardRank implements Comparable<PlayingCardRank> {
    public static final String ACE = "Ace";
    public static final String DEUCE = "Deuce";
    public static final String JACK = "Jack";
    public static final String QUEEN = "Queen";
    public static final String KING = "King";
    public static final Integer MINIMUM = 2;
    public static final Integer MAXIMUM = 14;
    
    private Integer rank;
    
    public PlayingCardRank(Integer rank) {
        if (rank < MINIMUM) {
            throw new RuntimeException("PlayingCardCardinal " + rank.toString() + " must not be < 1.");
        }
        if (MAXIMUM < rank) {
            throw new RuntimeException("PlayingCardCardinal " + rank.toString() + " must not be > 13.");
        }
        this.rank = rank;
    }
    public PlayingCardRank(String name) {
        switch (name) {
            case ACE:
                rank = MAXIMUM;
                break;
            case DEUCE:
                rank = MINIMUM;
                break;
            case JACK:
                rank = 11;
                break;
            case QUEEN:
                rank = 12;
                break;
            case KING:
                rank = 13;
                break;
            default:
                throw new RuntimeException("PlayingCardOrdinal " + name + " is not a legal name.");
        }
    }
    Integer getValue() {
        return rank;
    }
    public String toDescription() {
        return "[" + toString() + ": " +
                    (isFace() ? "face" : "pip") +
                    ", " + getPipCount() + "]";
    }
    @Override
    public String toString() {
        String result = rank.toString();
        switch (rank) {
            case 14:
                result = ACE;
                break;
            case 2:
                result = DEUCE;
                break;
            case 11:
                result = JACK;
                break;
            case 12:
                result = QUEEN;
                break;
            case 13:
                result = KING;
                break;
        }
        return result;
    }
    public boolean equals(PlayingCardRank other) {
        return rank.equals(other.getValue());
    }
    @Override
    public int compareTo(PlayingCardRank other) {
        return rank.compareTo(other.rank);
    }
    public Boolean isFace() {
        Boolean result = false;
        switch (rank) {
            case 11:
                result = true;
                break;
            case 12:
                result = true;
                break;
            case 13:
                result = true;
                break;
        }
        return result;
    }
    public Integer getPipCount() {
        Integer pipCount = rank;
        if (14 == rank) {
            pipCount = 1;
        }
        return pipCount;
    }
}
