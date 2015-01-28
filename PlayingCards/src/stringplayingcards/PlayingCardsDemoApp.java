/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stringplayingcards;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author robinschaufler
 */
public class PlayingCardsDemoApp {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        demoSuits();
        demoRanks();
        demoCards();
        demoDeck();
    }
    
    private static <t> String join(List<t> ol) {
        String result = "";
        boolean isTail = false;
        for (Object o: ol) {
            if (isTail) {
                result += ", ";
            }
            isTail = true;
            result += o.toString();
        }
        return result;
    }
    
    private static void demoSuits() {
        List<PlayingCardSuit> suits = new ArrayList<>(PlayingCardSuit.MAXIMUM);
        for (int i = PlayingCardSuit.MINIMUM;
                i <= PlayingCardSuit.MAXIMUM;
                i++) {
            suits.add(i - PlayingCardSuit.MINIMUM, new PlayingCardSuit(i));
        }
        System.out.println(join(suits));
        Collections.reverse(suits);
        System.out.println(join(suits));
        Collections.sort(suits);
        System.out.println(join(suits));
    }
    
    private static void demoRanks() {
        int INCR = 4;
        int listSize = (PlayingCardRank.MAXIMUM - PlayingCardRank.MINIMUM) / INCR + 1;
        List<PlayingCardRank> ranks = new ArrayList(listSize);
        for (int i = PlayingCardRank.MINIMUM;
                i <= PlayingCardRank.MAXIMUM;
                i += INCR) {
            ranks.add(new PlayingCardRank(i));
        }
        System.out.println(new PlayingCardRank(PlayingCardRank.KING).toDescription());
        List<String> descriptions = new ArrayList(ranks.size());
        for (PlayingCardRank rank: ranks) {
            descriptions.add(rank.toDescription());
        }
        System.out.println(join(descriptions));
        Collections.reverse(ranks);
        System.out.println(join(ranks));
        Collections.sort(ranks);
        System.out.println(join(ranks));
    }
    
    private static void demoCards() {
        int INCR = 4;
        int handSize = PlayingCardSuit.MAXIMUM * (
                (PlayingCardRank.MAXIMUM - PlayingCardRank.MINIMUM) / INCR + 1);
        PlayingCardHand hand = new PlayingCardHand(handSize);
        for (int i = PlayingCardSuit.MINIMUM;
                i <= PlayingCardSuit.MAXIMUM;
                i++) {
            for (int j = PlayingCardRank.MINIMUM;
                    j <= PlayingCardRank.MAXIMUM;
                    j += INCR) {
                hand.add(new PlayingCard(i, j));
            }
        }
        List<PlayingCard> orderedHand = hand.getCardsInAscendingOrder();
        System.out.println(join(orderedHand));
        Collections.reverse(orderedHand);
        System.out.println(join(orderedHand));
        orderedHand = hand.getCardsInAscendingOrder(PlayingCardHand.ACES_LOW);
        System.out.println(join(orderedHand));
    }
    
    private static void demoDeck() {
        PlayingCardDeck deck = new PlayingCardDeck();
        
        System.out.println("Deck size is " + deck.size());
        System.out.println("Max hand size is " + PlayingCardHand.MAX_HAND_SIZE);
        
        int modulus = 0;
        final int INTERVAL = 5;
        List<PlayingCard> orderedDeck = deck.getCardsInAscendingOrder();
        List<PlayingCard> sampleHand = new ArrayList((deck.size() / INTERVAL) + 1);
        for (PlayingCard card: orderedDeck) {
            if (0 == modulus) {
                sampleHand.add(card);
            }
            modulus = (modulus + 1) % INTERVAL;
        }
        System.out.println(join(sampleHand));
        
        PlayingCardDeck shuffled = deck.shuffle();
        Map<Integer, Integer> counts = new HashMap(3);
        counts.put(-1, 0);
        counts.put(0, 0);
        counts.put(1, 0);
        PlayingCard prevCard = null;
        for (PlayingCard curCard: shuffled) {
            if (null == prevCard) {
                prevCard = curCard;
                continue;
            }
            int comparison = prevCard.compareTo(curCard);
            if (1 < comparison) {
                comparison = 1;
            }
            if (comparison < -1) {
                comparison = -1;
            }
            Integer comparisonCount = counts.get(Integer.valueOf(comparison));
            counts.put(comparison, comparisonCount + 1);
            prevCard = curCard;
        }
        System.out.println("Shuffled: " +
                counts.get(-1).toString() + " less, " +
                counts.get(0).toString() + " equal, " +
                counts.get(1).toString() + " greater");
    }
}
