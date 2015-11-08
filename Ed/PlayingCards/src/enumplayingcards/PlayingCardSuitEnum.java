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
public enum PlayingCardSuitEnum {
    CLUBS,
    DIAMONDS,
    HEARTS,
    SPADES,
    JOKER;
    
    public PlayingCardColorEnum getColor() {
        switch (this) {
            case CLUBS:
                return PlayingCardColorEnum.BLACK;
            case DIAMONDS:
                return PlayingCardColorEnum.RED;
            case HEARTS:
                return PlayingCardColorEnum.RED;
            case SPADES:
                return PlayingCardColorEnum.BLACK;
        }
        return null;
    }
}
