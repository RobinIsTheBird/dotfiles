/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enumplayingcards;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;

/**
 *
 * @author robinschaufler
 */
public class PlayingCardHand extends LinkedHashSet<PlayingCard> {
    
    public static class AcesLow implements Comparator<PlayingCard> {

        @Override
        public int compare(PlayingCard card1, PlayingCard card2) {
            if (card1.equals(card2)) {
                    return 0;
                }
                if (card1.isJoker()) {
                    return 1;
                }
                if (card2.isJoker()) {
                    return -1;
                }
                int comparison = card1.getSuit().compareTo(card2.getSuit());
                if (0 != comparison) {
                    return comparison;
                }
                return card1.getRank().get().compareTo(card2.getRank().get());
        }
    }
    
    public static final Integer MAX_HAND_SIZE = PlayingCard.values().length;
    
    public PlayingCardHand() {
        super();
    }
    public PlayingCardHand(Integer handSize)
            throws UnsupportedOperationException {
        super(handSize);
        if ((MAX_HAND_SIZE) < handSize) {
            throw new UnsupportedOperationException();
        }
    }
    public List<PlayingCard> getCardsInAscendingOrder() {
        List<PlayingCard> cards = new ArrayList(this);
        Collections.sort(cards);
        return cards;
    }
    public List<PlayingCard> getCardsInAscendingOrder(Comparator<PlayingCard> c) {
        List<PlayingCard> cards = new ArrayList(this);
        Collections.sort(cards, c);
        return cards;
    }
}
