/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stringplayingcards;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

/**
 *
 * @author robinschaufler
 */
public class PlayingCardHand extends LinkedHashSet<PlayingCard> {
    
    private static class RandomCard implements Comparable<RandomCard> {
        Integer ordinal;
        PlayingCard card;
        
        public RandomCard (Integer ordinal, PlayingCard card) {
            this.ordinal = ordinal;
            this.card = card;
        }

        @Override
        public int compareTo(RandomCard other) {
            return ordinal.compareTo(other.ordinal);
        }
    }
    
    private static class AcesLow implements Comparator<PlayingCard> {

        @Override
        public int compare(PlayingCard card1, PlayingCard card2) {
            PlayingCardSuit suit1 = card1.getSuit();
            PlayingCardSuit suit2 = card2.getSuit();
            if (!suit1.equals(suit2)) {
                return suit1.compareTo(suit2);
            }
            PlayingCardRank rank1 = card1.getRank();
            PlayingCardRank rank2 = card2.getRank();
            return rank1.getPipCount().compareTo(rank2.getPipCount());
        }
        
    }
    
    public static final Integer MAX_HAND_SIZE = PlayingCard.MAX_ORDINAL + 1;
    
    public static final String ACES_LOW = "Aces low";
    private static final Map<String, Comparator<PlayingCard>> sortStrategies =
            new HashMap(1);
    
    static {
        sortStrategies.put(ACES_LOW, new AcesLow());
    }
    
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
    public List<PlayingCard> getCardsInAscendingOrder(String comparatorName) {
        List<PlayingCard> cards = new ArrayList(this);
        Collections.sort(cards, sortStrategies.get(comparatorName));
        return cards;
    }
    public PlayingCardHand shuffle() {
        List<RandomCard> randomCards = new ArrayList(this.size());
        Set<Integer> ordinals = new HashSet<>(this.size());
        Random randomizer = new Random();
        while (ordinals.size() < this.size()) {
            ordinals.add(randomizer.nextInt());
        }
        Iterator<Integer> randomOrdinals = ordinals.iterator();
        for (PlayingCard card: this) {
            randomCards.add(new RandomCard(randomOrdinals.next(), card));
        }
        Collections.sort(randomCards);
        PlayingCardHand shuffledHand = new PlayingCardHand(this.size());
        for (RandomCard randomCard: randomCards) {
            shuffledHand.add(randomCard.card);
        }
        return shuffledHand;
    }
}
