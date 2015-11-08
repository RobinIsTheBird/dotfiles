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
public class PlayingCardSuit implements Comparable<PlayingCardSuit> {
    public static final String SPADES = "Spades";
    public static final String DIAMONDS = "Diamonds";
    public static final String HEARTS = "Hearts";
    public static final String CLUBS = "Clubs";
    public static final String RED = "Red";
    public static final String BLACK = "Black";
    public static final Integer MINIMUM = 1;
    public static final Integer MAXIMUM = 4;
    
    private Integer suitNumber;
    private String suitColor;
    
    public PlayingCardSuit(Integer suit) {
        if (suit < 1) {
            throw new RuntimeException("PlayingCardCardinal " + suit.toString() + " must not be < 1.");
        }
        if (4 < suit) {
            throw new RuntimeException("PlayingCardCardinal " + suit.toString() + " must not be > 13.");
        }
        if (suit == 1 || suit == 4) {
            suitColor = BLACK;
        } else {
            suitColor = RED;
        }
        suitNumber = suit;
    }
    public PlayingCardSuit(String name) {
        switch (name) {
            case SPADES:
                suitNumber = 4;
                break;
            case DIAMONDS:
                suitNumber = 3;
                break;
            case HEARTS:
                suitNumber = 2;
                break;
            case CLUBS:
                suitNumber = 1;
                break;
            default:
                throw new RuntimeException("PlayingCardSuit " + name + " is invalid.");
        }
    }
    public Integer getSuitNumber() {
        return suitNumber;
    }
    public String getSuitColor() {
        return suitColor;
    }
    @Override
    public String toString() {
        switch (suitNumber) {
            case 1:
                return CLUBS;
            case 2:
                return HEARTS;
            case 3:
                return DIAMONDS;
            case 4:
                return SPADES;
        }
        throw new RuntimeException("Suit number must be between 1 and 4, but it is " + suitNumber.toString());
    }
    public boolean equals(PlayingCardSuit other) {
        return suitNumber.equals(other.getSuitNumber());
    }
    @Override
    public int compareTo(PlayingCardSuit other) {
        return suitNumber.compareTo(other.getSuitNumber());
    }
}
