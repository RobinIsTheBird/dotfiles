/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enumplayingcards;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author robinschaufler
 */
public class PlayingCardsEnumApp {
    
    static final PlayingCard[] cardArray = {
            PlayingCard.JOKER1,
            PlayingCard.JOKER2,
            PlayingCard.DEUCE_OF_HEARTS,
            PlayingCard.DEUCE_OF_CLUBS,
            PlayingCard.ACE_OF_HEARTS,
            PlayingCard.ACE_OF_CLUBS,
            PlayingCard.JACK_OF_CLUBS,
            PlayingCard.JACK_OF_HEARTS
        };
    
    public static void main(String[] args) {
        demoRanks();
        demoSuits();
        demoCards();
        demoHand();
        demoDeck();
    }
    
    // Replace with StringBuilder
    private static <t> String join(Collection<t> ol) {
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
    
    private static void demoRanks() {
        for (PlayingCardRankEnum r: PlayingCardRankEnum.values()) {
            System.out.printf("Rank %s is %d%n", r, r.get());
        }
        Integer comparison = PlayingCardRankEnum.THREE.compareTo(PlayingCardRankEnum.SIX);
        System.out.printf("THREE compared to SIX is %d%n", comparison);
        comparison = PlayingCardRankEnum.KING.compareTo(PlayingCardRankEnum.ACE);
        System.out.printf("KING compared to ACE is %d%n", comparison);
        PlayingCardRankEnum rank = PlayingCardRankEnum.get(11);
        if (rank != null) {
            System.out.printf("Rank for 11 is %s%n", rank);
            if (rank.isFace()) {
                System.out.printf("%s is a face card%n", rank);
            }
        }
    }
    
    private static void demoSuits() {
        for (PlayingCardSuitEnum s: PlayingCardSuitEnum.values()) {
            System.out.printf("Suit %s is %s%n", s, s.getColor());
        }
    }
    
    private static void demoCards() {
        List<PlayingCard> hand = Arrays.asList(cardArray);
        System.out.println(join(hand));
        Collections.sort(hand);
        System.out.println(join(hand));
        Collections.sort(hand, new Comparator<PlayingCard>() {

            @Override
            public int compare(PlayingCard o1, PlayingCard o2) {
                if (o1.equals(o2)) {
                    return 0;
                }
                if (o1.isJoker()) {
                    return 1;
                }
                if (o2.isJoker()) {
                    return -1;
                }
                int comparison = o1.getSuit().compareTo(o2.getSuit());
                if (0 != comparison) {
                    return comparison;
                }
                return o1.getRank().get().compareTo(o2.getRank().get());
            }
            
        });
        System.out.println("Aces low: " + join(hand));
    }
    
    private static void demoHand() {
        PlayingCardHand hand = new PlayingCardHand(cardArray.length);
        Collections.addAll(hand, cardArray);
        System.out.println("Hand: " + join(hand));
        System.out.println("Ascending hand: " + hand.getCardsInAscendingOrder());
        System.out.println("Aces low: " + hand.getCardsInAscendingOrder(new PlayingCardHand.AcesLow()));
    }
    
    private static void demoDeck() {
        PlayingCardDeck deck = new PlayingCardDeck();
        System.out.printf("Deck has %d cards%n", deck.size());
        Collections.shuffle(deck);
        System.out.printf("After shuffling, deck has %d cards%n", deck.size());
        
        Map<Integer, Integer> counts = new HashMap(3);
        counts.put(-1, 0);
        counts.put(0, 0);
        counts.put(1, 0);
        PlayingCard prevCard = null;
        for (PlayingCard curCard: deck) {
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
