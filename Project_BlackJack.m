% This code was created by Sam Rothlisberger
% Project 1
% 03/27/2020
%Q1: On average, when should I "hit" or stand (card value 15,16,17,etc.)?

%Q2:Does increasing the number of decks used/ game change my results?

%Q3- Card Counting: Does assigning tag values to increase of decrease bet amount increase my winnings?
       %Assign a tag of (+1) to every 2- 6 ranked cards and a tag of (–1) to every 10-A
       %After each round,if the count is positive, increase your bet. If
       %the count is negative, decrease your bet. 
%%
close all, clear all, format compact
decks=2;
total_cards=decks*52; %% total number of decks used when shuffling cards at casino
value_dealer=0; %single card value of dealer
value_player=0; %single card value of player
value_dealer_total=0; %value of cards for dealer on table
value_player_total=0; %value of cards for player on table
card_A=1; %values for all cards in a deck in blackjack
card_2=2;
card_3=3;
card_4=4;
card_5=5;
card_6=6;
card_7=7;
card_8=8;
card_9=9;
card_10=10;
card_jack=10;
card_king=10;
card_queen=10;

num_card_A=4*decks; %number of each type of card in each game
num_card_2=4*decks;
num_card_3=4*decks;
num_card_4=4*decks;
num_card_5=4*decks;
num_card_6=4*decks;
num_card_7=4*decks;
num_card_8=4*decks;
num_card_9=4*decks;
num_card_10=4*decks;
num_card_jack=4*decks;
num_card_king=4*decks;
num_card_queen=4*decks;


clear_round=false; %when someone wins a round, we clear the table and start again 
cards=0; %number of cards used is incrimented
cards_table=0; %number of cards on the table is tracked
bet_player=1; %bet in dollar amount 
money_won = 0.0; %money won by player after each game
round_winnings=0.0; %money won by player at the end of the night (multiple games)
N=2000; %number of games used (to determine % chance to win)
games_won=0; %games won is originally zero
tag_value=0; %if tags are used, it starts at 0 
positive_winnings=0;
for games=1:N %lets assume a player plays multiple games when at a casino
cards=0; %no cards have been used yet
card_table=0; %the game hasn't started, so there are no cards on the table
num_card_A=4*decks; %Every new game starts with a full deck(s) and each card has their max number
num_card_2=4*decks; 
num_card_3=4*decks;
num_card_4=4*decks;
num_card_5=4*decks;
num_card_6=4*decks;
num_card_7=4*decks;
num_card_8=4*decks;
num_card_9=4*decks;
num_card_10=4*decks;
num_card_jack=4*decks;
num_card_king=4*decks;
num_card_queen=4*decks;
round_winnings=0;
money_won = 0;
while cards<(total_cards-1) %the game continues as long as the cards used is less than the cards we have for the game
    
    if cards_table < 4 %game starts with 2 cards dealt to dealer and player
    
[out_card_A, out_card_2, out_card_3, out_card_4, out_card_5, out_card_6, out_card_7, out_card_8,out_card_9, out_card_10, out_card_jack, out_card_king, out_card_queen, random_value] = random_card_value(num_card_A, num_card_2, num_card_3, num_card_4, num_card_5, num_card_6, num_card_7, num_card_8,num_card_9, num_card_10, num_card_jack, num_card_king, num_card_queen, cards, total_cards, decks, value_dealer_total);
   %function finds random card value for dealer
   
num_card_A=out_card_A; %updates number of cards for each card type after dealing 1 random card to dealer
num_card_2=out_card_2;
num_card_3=out_card_3;
num_card_4=out_card_4;
num_card_5=out_card_5;
num_card_6=out_card_6;
num_card_7=out_card_7;
num_card_8=out_card_8;
num_card_9=out_card_9;
num_card_10=out_card_10;
num_card_jack=out_card_jack;
num_card_king=out_card_king;
num_card_queen=out_card_queen;
value_dealer = random_value; %gives the value of the random card dealt

   value_dealer_total=value_dealer_total + value_dealer; %value of card is added to table for dealer
   cards_table=cards_table+1; %1 more card is now on table
   cards=cards+1; %1 more card is now used from total cards
if value_dealer >= 10 
    tag_value= tag_value-1;
elseif value_dealer >=2 && value_dealer <=6 
    tag_value = tag_value+1;
else
   
end
   
   
[out_card_A, out_card_2, out_card_3, out_card_4, out_card_5, out_card_6, out_card_7, out_card_8,out_card_9, out_card_10, out_card_jack, out_card_king, out_card_queen, random_value] = random_card_value(num_card_A, num_card_2, num_card_3, num_card_4, num_card_5, num_card_6, num_card_7, num_card_8, num_card_9, num_card_10, num_card_jack, num_card_king, num_card_queen, cards, total_cards, decks, value_player_total);
   %function finds random card value for player
num_card_A=out_card_A; %updates the number of cards for each type
num_card_2=out_card_2;
num_card_3=out_card_3;
num_card_4=out_card_4;
num_card_5=out_card_5;
num_card_6=out_card_6;
num_card_7=out_card_7;
num_card_8=out_card_8;
num_card_9=out_card_9;
num_card_10=out_card_10;
num_card_jack=out_card_jack;
num_card_king=out_card_king;
num_card_queen=out_card_queen;
value_player = random_value; %returns random card value 
    
   value_player_total=value_player_total + value_player; %value of card is added to the table for player
   cards_table=cards_table+1; %1 more card is now on the table
   cards=cards+1; %1 more card is now used from total cards
   
if value_player >= 10 %if the card picked is a high card (good for player when in deck)
    tag_value= tag_value-1; %-1 tag value (decrease bet)
elseif value_player >=2 && value_player <=6 %if the card picked is a 2-6 rank card (good for player when used)
    tag_value = tag_value+1;%+1 tag value (increase bet)
else
    %other cards don't affect the tag value
end  
   
   
end
   
   
   
   if cards_table >= 4 %after initial cards are dealt, player decides to take another card, or stand
       
       if value_player_total <= 16 %if the current value on table for the player is <15, take another card
           player_hit=true;
           
while (value_player_total <=16) %Keep on dealing cards to player until their value is >15
               
[out_card_A, out_card_2, out_card_3, out_card_4, out_card_5, out_card_6,out_card_7, out_card_8,out_card_9, out_card_10, out_card_jack, out_card_king,  out_card_queen, random_value] = random_card_value(num_card_A, num_card_2, num_card_3, num_card_4, num_card_5, num_card_6, num_card_7, num_card_8, num_card_9, num_card_10, num_card_jack, num_card_king, num_card_queen, cards, total_cards, decks, value_player_total);
   
num_card_A=out_card_A;
num_card_2=out_card_2;
num_card_3=out_card_3;
num_card_4=out_card_4;
num_card_5=out_card_5;
num_card_6=out_card_6;
num_card_7=out_card_7;
num_card_8=out_card_8;
num_card_9=out_card_9;
num_card_10=out_card_10;
num_card_jack=out_card_jack;
num_card_king=out_card_king;
num_card_queen=out_card_queen;
value_player = random_value;
    
   value_player_total=value_player_total + value_player;
   
   cards_table=cards_table+1;
   cards=cards+1;
   
 if value_player >= 10 
   tag_value= tag_value-1;
elseif value_player >=2 && value_player <=6 
    tag_value = tag_value+1;
else
    
end
               
end

if value_player_total >21
     clear_game=true;
end
   
     


   else
           player_hit=false; %if the value of players cards on table is greater than 15, stand 
                
while( value_dealer_total <17 && clear_round ~= true) %dealers are required to deal cards for themselves if their value is less than 17
           
[out_card_A, out_card_2, out_card_3, out_card_4, out_card_5, out_card_6,out_card_7, out_card_8,out_card_9, out_card_10, out_card_jack, out_card_king, out_card_queen, random_value] = random_card_value(num_card_A, num_card_2, num_card_3,num_card_4, num_card_5, num_card_6, num_card_7, num_card_8,num_card_9, num_card_10,num_card_jack, num_card_king, num_card_queen, cards, total_cards, decks, value_dealer_total);
   
num_card_A=out_card_A;
num_card_2=out_card_2;
num_card_3=out_card_3;
num_card_4=out_card_4;
num_card_5=out_card_5;
num_card_6=out_card_6;
num_card_7=out_card_7;
num_card_8=out_card_8;
num_card_9=out_card_9;
num_card_10=out_card_10;
num_card_jack=out_card_jack;
num_card_king=out_card_king;
num_card_queen=out_card_queen;
value_dealer = random_value;
value_dealer_total=value_dealer_total + value_dealer;
cards_table=cards_table+1;
cards=cards+1;
if value_dealer >= 10 
    tag_value= tag_value-1;
else
    tag_value = tag_value+1;
end
       
    end
   clear_round =true; %when the dealers total card value is >=17, the round is done and numbers are compared
    end

   
   end
   
   
   
if clear_round == true
   if value_player_total < value_dealer_total && value_dealer_total < 21 || value_player_total > 21 %player value is lower than dealer value
    money_won = money_won - bet_player; %player losses 
elseif value_player_total > value_dealer_total && value_player_total < 21 %player value is greater than dealer value
    money_won = money_won + bet_player; %player wins 
elseif value_player_total == 21 && value_dealer_total ~= 21 %player gets a blackjack, dealer does not
    money_won = money_won + 1.5*bet_player; %player wins
elseif value_dealer_total == 21 && value_player_total ~= 21 %dealer gets blackjack, player does not
       money_won = money_won - bet_player; %player losses
elseif value_player_total == value_dealer_total %dealer value equals player value 
     %round is pushed (no one wins)
   end
   
     
 value_dealer_total=0; %player and dealer card values are reset
 value_player_total=0; 
 clear_round=false; %starts new round
 cards_table=0; %round is over, so clear table

 if tag_value >=1 %if the tag values at the end of the round are > 1
     bet_player = 5; %increase bet (game is in players favor)
 elseif tag_value < 0 %if <0 
    bet_player = 0.5; %decrease bet (game not in players favor)
 else
     bet_player= 1; %bet stays the same if tag=0
 end

 round_winnings = round_winnings + money_won; %wins per game are summed every round
end

end

if round_winnings > 0
    positive_winnings=positive_winnings+round_winnings; %adds positive winnings to a sum each game 
    games_won = games_won + 1; %if a player comes out on top at the end of a game (all the cards), they 'won'
end
tag_value = 0;
bet_player=1;

end

fprintf('Using %d decks per game for %d games, a player has a %d percent chance they will win money \n',decks,games, (games_won*100 / games));
fprintf('The positive winnings for each game is on average %d \n', (positive_winnings / games));
