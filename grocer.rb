def consolidate_cart(cart)
  consolidated = {}
  items = []
  cart.each do |hsh|
    hsh.each do |item,money|
      if not items.include?(item)
        items << item
      end
    end
  end
  
  counts = [0]*items.length
  cart.each do |hsh|
    hsh.each do |item|
      items.each_with_index do |it,index|
        if item.keys[0] == it
          counts[index] = counts[index] + 1
        end
      end
    end
  end
  
  consolidated_array = cart.uniq
  
  consolidated_array.each_with_index do |hsh,index|
    consolidated[items[index]] = hsh[index][items[index]]
  end
  
  return consolidated
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
