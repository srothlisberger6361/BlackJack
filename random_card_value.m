function [out_card_A, out_card_2, out_card_3, out_card_4, out_card_5, out_card_6, out_card_7, out_card_8,out_card_9, out_card_10, out_card_jack, out_card_king, out_card_queen, random_value] = random_card_value(num_card_A, num_card_2, num_card_3, num_card_4, num_card_5, num_card_6, num_card_7, num_card_8,num_card_9, num_card_10, num_card_jack, num_card_king, num_card_queen, cards, total_cards, decks, value_current)

%{   
This function takes in all the number of cards for each type of card, the
 decks used per game,the number of cards already used, and the current value of the
player/dealer. The cards used and number of cards of each type are needed to
ensure probabilty of choosing each card is equal as game goes on. The
current value of the dealer/player are needed to ensure an 11 or 1 is
correctly chosen depending on their current value

Output is the updated number of cards for each type of card which will only
be minus 1 for one of the cards. For the rest, the output will be the same
as the input. Also outputed is of course the random card value to be dealt

%}

Data=[num_card_A, num_card_2, num_card_3, num_card_4, num_card_5, num_card_6, num_card_7, num_card_8, num_card_9, num_card_10, num_card_jack, num_card_queen, num_card_king];
% Data creates a vector for the number of cards for each card type left (0-8) 
cards_left = total_cards - cards; %calculates how many total cards are actually left in the game

Data_value(1)=1; %Value of each card type corresponding to the data vector
Data_value(2)=2;
Data_value(3)=3;
Data_value(4)=4;
Data_value(5)=5;
Data_value(6)=6;
Data_value(7)=7;
Data_value(8)=8;
Data_value(9)=9;
Data_value(10)=10;
Data_value(11)=10;
Data_value(12)=10;
Data_value(13)=10;


out_card_A = num_card_A; %all the number of cards for each type are going to be returned the same, except 1 (random card)
out_card_2 = num_card_2;
out_card_3 = num_card_3;
out_card_4 = num_card_4;
out_card_5 = num_card_5;
out_card_6 = num_card_6;
out_card_7 = num_card_7;
out_card_8 = num_card_8;
out_card_9 = num_card_9;
out_card_10 = num_card_10;
out_card_jack = num_card_jack;
out_card_queen = num_card_queen;
out_card_king = num_card_king;

value_rand = rand(1) * 100; %random number is chosen 0-100 

%brackets range from 0-100 and are made so that no matter how many cards of
%each type there is (1, 2, 4, etc) their "width" along the range of 0-100
%will change, but it will not affect the other cards "width". In this way,
%a random value of 0-100 is put along the range somewhere which corresponds
%to a place within the "width" of a card. 

bracket_1 = Data(1)*100/cards_left; %ex) number of Aces left * 100 / cards left = probability for an Ace to be chosen given number of cards in game and number of Ace's in game 
bracket_2 = bracket_1 + (Data(2) * 100/cards_left); %recurcive
bracket_3 = bracket_2 + (Data(3) * 100 /cards_left);
bracket_4 = bracket_3 + (Data(4) * 100 /cards_left);
bracket_5 = bracket_4 + (Data(5) * 100 /cards_left);
bracket_6 = bracket_5 + (Data(6) * 100 /cards_left);
bracket_7 = bracket_6 + (Data(7) * 100 /cards_left);
bracket_8 = bracket_7 + (Data(8) * 100 /cards_left);
bracket_9 = bracket_8 + (Data(9) * 100 /cards_left);
bracket_10 = bracket_9 + (Data(10) * 100 /cards_left);
bracket_11 = bracket_10 + (Data(11) * 100 /cards_left);
bracket_12 = bracket_11 + (Data(12) * 100 /cards_left);
bracket_13 = bracket_12 + (Data(13) * 100 /cards_left);

%these statements determine what value to assign to the random card value
%given the probability we calculated along the range 0-100 above

 if value_rand >0 && value_rand <= bracket_1 %ex) if the random value is in region 1 (Ace), random card is Ace
        out_card_A = num_card_A - 1; %number of Aces is one less and is returned in output of function
            if value_current+11 <= 21 %current player/dealer value is used to determine if we assign value of 1 or 11 to the card
                random_value=Data_value(1) + 10; %Data_value(1) corresponds to Ace card value (1 or 11)
            else 
                random_value=Data_value(1);
            end
    elseif value_rand > bracket_1 &&  value_rand <= bracket_2
        random_value = Data_value(2);
        out_card_2 = num_card_2 - 1;
        
    elseif value_rand > bracket_2 &&  value_rand <= bracket_3
        random_value = Data_value(3);
        out_card_3 = num_card_3 - 1;
        
    elseif value_rand > bracket_3 &&  value_rand <= bracket_4
        random_value = Data_value(4);
        out_card_4 = num_card_4 - 1;
        
    elseif value_rand > bracket_4 &&  value_rand <= bracket_5
       random_value = Data_value(5);
        out_card_5 = num_card_5 - 1;
        
    elseif value_rand > bracket_5 &&  value_rand <= bracket_6
        random_value = Data_value(6);
        out_card_6 = num_card_6 - 1;
        
    elseif value_rand > bracket_6 &&  value_rand <= bracket_7
        random_value = Data_value(7);
        out_card_7 = num_card_7 - 1;
        
    elseif value_rand > bracket_7 &&  value_rand <= bracket_8
        random_value = Data_value(8);
        out_card_8 = num_card_8 - 1;
        
    elseif value_rand > bracket_8 &&  value_rand <= bracket_9
        random_value = Data_value(9);
        out_card_9 = num_card_9 - 1;
        
    elseif value_rand > bracket_9 &&  value_rand <= bracket_10
        random_value = Data_value(10);
        out_card_10 = num_card_10 - 1;
        
    elseif value_rand > bracket_10 &&  value_rand <= bracket_11
        random_value = Data_value(11);
        out_card_jack = num_card_jack - 1;
        
    elseif value_rand > bracket_11 &&  value_rand <= bracket_12
        random_value = Data_value(12);
        out_card_queen = num_card_queen - 1;
        
 else % value_rand > bracket_12 && value_rand <= bracket_13
       random_value = Data_value(13);
       out_card_king = num_card_king - 1;
 
 end
end

