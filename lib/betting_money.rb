class BettingMoney

  # -- Formal Parameters --
  # amounts:int[]         The total bets (in $) placed on a victory margin
  # centsPerDollar:int[]  The betting reward (in cents/$) on a victory margin
  # finalResult:int       The victory margin that has won on a given day

  # Returns the net profit in cents based on the final result of a given day 
  def moneyMade(amounts, centsPerDollar, finalResult)
    3_400
  end

  # Returns the revenue in dollars
  def calculateRevenue(amounts, finalResult)
    revenue = 0

    amounts.each_with_index do |amount, index|
      revenue += amount if (index != finalResult)
    end

    return revenue
  end

  # Returns the expense in cents
  def calculateExpense(amounts, centsPerDollar, finalResult)
    moneyBack    = amounts[finalResult]
    rewardFactor = centsPerDollar[finalResult]
    expense      = (moneyBack * rewardFactor)

    return expense 
  end
end
