/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enumplayingcards;

/**
 *
 * @author robinschaufler
 */
public enum PlayingCardRankEnum {
    DEUCE(2),
    THREE(3),
    FOUR(4),
    FIVE(5),
    SIX(6),
    SEVEN(7),
    EIGHT(8),
    NINE(9),
    TEN(10),
    JACK(11),
    QUEEN(12),
    KING(13),
    ACE(1);
    
    public static final Integer MIN_VALUE = 1;
    public static final Integer MAX_VALUE = 13;
    private final Integer rank;
    
    PlayingCardRankEnum(Integer cardRank) {
        rank = cardRank;
    }
    public Integer get() {
        return rank;
    }
    public Boolean isFace() {
        return TEN.rank < rank;
    }
    public static PlayingCardRankEnum get(Integer requestedRank) {
        for (PlayingCardRankEnum r: PlayingCardRankEnum.values()) {
            if (r.rank.equals(requestedRank)) {
                return r;
            }
        }
        return null;
    }
}
