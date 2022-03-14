def stock_picker(prices)
  maximum_profit = 0
  best_buy = [0, 0]
  prices.each_with_index do |stock_price, price_index|
	# Loop through prices and find highest profit for a given starting value
	# compared to all other prices in the array
    for i in price_index...prices.size
      buy = prices[price_index]
      sell = prices[i]

      if buy <= sell
        profit = sell - buy
      elsif buy > sell
        profit = sell - buy
      end
 
      if profit > maximum_profit
		maximum_profit = profit
		best_buy = [price_index, i]
      end
      
    end
    
   end
   result = "Prices for today: #{prices}\n"
   result += "Buy at #{prices[best_buy[0]]}$, sell at #{prices[best_buy[1]]}$ for a profit of #{maximum_profit}$\n\n"
   result # return a formatted report giving the best buy/sell positions and profit
end

puts stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
puts stock_picker([1, 2, 3, 4, 5, 6, 7, 8])
puts stock_picker([500, 2, 4, 5, 6, 100, 10, 25, 0])
