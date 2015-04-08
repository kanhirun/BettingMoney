require 'spec_helper'


describe BettingMoney::Model do
  let(:bettingMoney) { BettingMoney::Model.new }


  describe "#moneyMade" do
    describe "The company gains money" do
      it "should return 3,400 as the amount of cents earned" do
        earnings = bettingMoney.moneyMade([10, 20, 30],
                                          [20, 30, 40],
                                          1)
        expect(earnings).to eql(3_400)
      end

      it "should return 49,000 as the amount of cents earned" do
        earnings = bettingMoney.moneyMade([200, 300, 100],
                                           [10, 10, 10],
                                           2)
        expect(earnings).to eql(49_000)
      end

      it "should return 29,500 as the amount of cents earned" do
        earnings = bettingMoney.moneyMade([100, 100, 100, 100],
                                           [5, 5, 5, 5],
                                           0)
        expect(earnings).to eql(29_500)
      end
    end

    describe "The company doesn't gain anything" do
      it "should return 0 as the amount of cents earned" do
        earnings = bettingMoney.moneyMade([5000, 5000],
                                           [100, 2],
                                           0)
        expect(earnings).to be_zero 
      end
    end

    describe "The company loses money" do
      it "should return -1000 as the amount of cents loss" do
        losses = bettingMoney.moneyMade([100],
                                         [10],
                                         0)
        expect(losses).to eql(-1_000)
      end
    end
  end


  describe "#calculateRevenue" do
    it "should return 40 as the revenue in dollars" do
      revenue = bettingMoney.calculateRevenue([10, 20, 30], 1)

      expect(revenue).to eql(40)
    end

    it "should return 30 as the revenue in dollars" do
      revenue = bettingMoney.calculateRevenue([10, 20, 30], 2)

      expect(revenue).to eql(30)
    end
  end


  describe "#calculateExpense" do
    it "should return 600 as the expenses in cents" do
      expense = bettingMoney.calculateExpense([10, 20, 30],
                                              [20, 30, 40],
                                              1)
      expect(expense).to eql(20*30)
    end

    it "should return 30 as the expenses in cents" do
      expense = bettingMoney.calculateExpense([10, 20, 30],
                                              [20, 30, 40],
                                              0)
      expect(expense).to eql(10*20)
    end
  end
end
