class CashRegister
    attr_accessor :total, :discount, :items
    
    def initialize(discount = 0)
       @total = 0
       @discount = discount
       @items = []
    end

    def add_item(item, cost, optional = 0)
        @cost = 0
        if optional == 0 
            @cost = cost 
            self.total += cost 
            self.items << item
        else 
            self.total += (cost * optional)
            while optional > 0 
                @cost += cost
                self.items << item
                optional -= 1
            end
        end
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            self.total -= (discount.to_f/100)*total
            "After the discount, the total comes to $800."
        end
    end

    def void_last_transaction 
        self.total -= @cost
    end
end
