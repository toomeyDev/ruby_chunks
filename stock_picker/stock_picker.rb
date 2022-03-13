def stock_picker(prices)
  maximum_profit = 0
  best_buy = [0, 0]
  prices.each_with_index do |stock_price, price_index|
	# Loop through prices and find highest profit for a given starting value
	# compared to all other prices in the array
    for i in price_index...prices.size
      profit = prices[i] - prices[price_index]
      if profit > maximum_profit
		maximum_profit = profit
		best_buy = [price_index, i]
      end
    end
   end
   p "Prices: #{prices}"
   p "Profit: #{maximum_profit}"
   best_buy
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
p stock_picker([1, 2, 3, 4, 5, 6, 7, 8])
p stock_picker([500, 2, 4, 5, 6, 100, 10, 25, 0])
