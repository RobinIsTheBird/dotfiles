/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stringplayingcards;

import java.util.Collection;

/**
 *
 * @author robinschaufler
 */
public class PlayingCardDeck extends PlayingCardHand {
    public PlayingCardDeck() {
        super(MAX_HAND_SIZE);
        for (int i = PlayingCardSuit.MINIMUM;
                i <= PlayingCardSuit.MAXIMUM;
                i++) {
            for (int j = PlayingCardRank.MINIMUM;
                    j <= PlayingCardRank.MAXIMUM;
                    j++) {
                super.add(new PlayingCard(i, j));
            }
        }
    }
    public PlayingCardDeck(PlayingCardHand hand) {
        super(MAX_HAND_SIZE);
        if (hand.size() < MAX_HAND_SIZE) {
            throw new UnsupportedOperationException(
            "PlayingCardDeck can only be created from a hand the size of a deck.");
        }
        for (PlayingCard card: hand) {
            super.add(card);
        }
    }
    @Override
    public boolean add(PlayingCard card) {
        return false;
    }
    @Override
    public boolean addAll(Collection c) {
        return false;
    }
    @Override
    public PlayingCardDeck shuffle() {
        return new PlayingCardDeck(super.shuffle());
    }
}
