package inheritplayingcards;

/*
 * Copyright (c) 1995, 2008, Oracle and/or its affiliates. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 *   - Neither the name of Oracle or the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */ 

public class DisplayDeck {
    private static int countNotEquals(Card c, Deck d) {
        int notEqualsCount = 0;
        for (int suit = Card.CLUBS; suit <= Card.SPADES; suit++) {
            for (int rank = Card.ACE; rank <= Card.KING; rank++) {
                Card drawn = d.getCard(suit, rank);
                if (c.getSuit() == suit && c.getRank() == rank) {
                    assert c.equals(drawn);
                    assert c.hashCode() == drawn.hashCode();
                }
                if (!c.equals(drawn)) {
                    assert c.hashCode() != drawn.hashCode();
                    notEqualsCount++;
                }
            }
        }
        return notEqualsCount;
    }
    public static void main(String[] args) {
        Deck deck = new Deck();
        for (int suit = Card.CLUBS; suit <= Card.SPADES; suit++) {
            for (int rank = Card.ACE; rank <= Card.KING; rank++) {
                Card card1 = deck.getCard(suit, rank);
                Card card2 = new Card(rank, suit);
                String cardDisplay = card1.toString();
                assert cardDisplay.equals(String.format("%s of %s",
                    Card.rankToString(rank),
                    Card.suitToString(suit)));
                assert cardDisplay.equals(card2.toString());
                assert card1.equals(card2) && card2.equals(card1);
                assert card1.hashCode() == card2.hashCode();
                assert (Deck.numCards - 1) == countNotEquals(card2, deck);
                
                System.out.println(cardDisplay);
            }
        }
        
        Deck anotherDeck = new Deck();
        assert anotherDeck.equals(deck) && deck.equals(anotherDeck);
        assert anotherDeck.hashCode() == deck.hashCode();
        assert anotherDeck.toString().equals(deck.toString()) && deck.toString().equals(anotherDeck.toString());
        assert String.format("%d cards", Deck.numCards).equals(deck.toString());
        
        System.out.println(deck.toString());
    }
}
