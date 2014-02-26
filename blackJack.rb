require 'pry'


def calculate_total(cards)
  arr = cards.map{|e| e[1] }

 total = 0

 arr.each do |value|
    if value == "A"
       total += 11
    elsif value.to_i == 0
       total += 10
    else
        total += value.to_i
    end
 end

 # correct for Aces
 arr.select{|e| e == "A"}.count.times do
      total -= 10 if total > 21
 end

total
 end
 puts "Welcome to BlackJack!"

 suits = ['H', 'D', 'S', 'C']
 cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

 deck = suits.product(cards)
 deck.shuffle!

#Deal cards

 naveencards = []
 dealerscards = []

 naveencards << deck.pop
 dealerscards << deck.pop
 naveencards << deck.pop
 dealerscards << deck.pop


dealertotal = calculate_total(dealerscards);
naveentotal = calculate_total(naveencards);

#Show Cards

puts "Dealer has: #{dealerscards[0]} and #{dealerscards[1]}, for a total of #{dealertotal}"
puts "Naveen has: #{naveencards[0]} and #{naveencards[1]} for a total of #{naveentotal}"
puts ""

# My turn
   if naveentotal == 21
     puts "Congratutlations, you hit blackjack! You win !"
   exit
   end

    while naveentotal < 21
     puts "what would you like to do ? 1)hit 2)play your hand again"
     hit_or_play_again = gets.chomp

     if !['1', '2'].include?(hit_or_play_again)
       puts "Error: you must enter 1 or 2"
     end

     if hit_or_play_again == "2"
        puts "You chose to play again"
        break
     end

 #hit
     new_card = deck.pop
     puts "Dealing card to player: #{new_card}"
     naveencards << new_card
     naveentotal = calculate_total(naveencards)
     puts "Your total is now : #{naveentotal}"

     if naveentotal == 21
       puts "Congratulations, you hit blackjack! You win!"
       exit
elsif naveentotal > 21
       puts "Sorry, it looks like you are busted Naveen "
       exit
     end
    end

#dealer turn

    if dealertotal == 21
      puts "Sorry dealer hit a black jack, Naveen you lose !"
      exit
    end


    while dealertotal < 17
    #hit
      new_card = deck.pop
      puts "dealing for new card for dealer: #{new_card}"
      dealerscards << new_card
      dealertotal = calculate_total(dealerscards)
      puts "Dealer total is now: #{dealertotal}"

     if dealertotal == 21
       puts "Sorry, dealer hit blackjack. You lose. "
       exit
     elsif dealertotal > 21
       puts "Congratulations, dealer busted! You win!"
     exit
    end
   end

 # Compare hands


  puts "Dealer's cards:"
  dealerscards.each do |card|
  puts "=> #{card}"
  end
  puts ""

  puts "Your cards:"
  naveencards.each do |card|
  puts "=> #{card}"
  end
  puts ""

  if dealertotal > naveentotal
  puts "Sorry, dealer wins."
  elsif dealertotal < naveentotal
  puts "Congratulations, you win!"
  else
  puts "It's a tie!"
  end

  exit






                   

