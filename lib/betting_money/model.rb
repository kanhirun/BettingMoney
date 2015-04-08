module BettingMoney
  class Model

    # -- Formal Parameters --
    # amounts:int[]         The total bets (in $) placed on all victory margins
    # centsPerDollar:int[]  The betting rewards (in cents/$) on all victory margins
    # finalResult:int       The victory margin that has won on a given day

    # Returns the net profit in cents based on the final result of a given day 
    def moneyMade(amounts, centsPerDollar, finalResult)
      revenue    = calculateRevenue(amounts, finalResult)
      expenses   = calculateExpense(amounts, centsPerDollar, finalResult)
      money_made = (convert_to_cents(revenue) - expenses)

      return money_made 
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

    private
      def convert_to_cents(dollars)
        return dollars * 100  # there is 100:1 cents to dollars
      end
  end
end
