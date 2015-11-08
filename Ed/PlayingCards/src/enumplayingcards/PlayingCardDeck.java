/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enumplayingcards;

import java.util.Arrays;
import localutils.NoDuplicatesList;

/**
 *
 * @author robinschaufler
 */
public class PlayingCardDeck extends NoDuplicatesList<PlayingCard> {
    
    public static final Integer REGULAR_SIZE = 52;
    public static final Integer JOKER_SIZE = PlayingCard.values().length;
    private int maxSize;
    
    public PlayingCardDeck() {
        maxSize = REGULAR_SIZE;
        PlayingCard[] cardArray = new PlayingCard[REGULAR_SIZE];
        System.arraycopy(PlayingCard.values(), 0, cardArray, 0, REGULAR_SIZE);
        addAll(Arrays.asList(cardArray));
    }
    
    public PlayingCardDeck(Boolean withJokers) {
        if (!withJokers) {
            throw new UnsupportedOperationException("With Jokers must be true");
        }
        maxSize = JOKER_SIZE;
        addAll(Arrays.asList(PlayingCard.values()));
    }
    
    private boolean clampSize(PlayingCardDeck saved) {
        boolean result = true;
        if (maxSize < size()) {
            clear();
            addAll(saved);
            result = false;
        }
        return result;
    }
    
    @Override
    public boolean add(PlayingCard c) {
        PlayingCardDeck saved = (PlayingCardDeck) clone();
        boolean result = super.add(c);
        return result && clampSize(saved);
    }
}
