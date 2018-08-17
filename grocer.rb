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
    items.each_with_index do |it,index|
      if hsh.keys[0] == it
        counts[index] = counts[index] + 1
      end
    end
  end
  
  consolidated_array = cart.uniq
  
  consolidated_array.each_with_index do |hsh,index|
    consolidated[items[index]] = hsh[items[index]]
    consolidated[items[index]][:count] = counts[index]
  end
  
  return consolidated
end

def apply_coupons(cart, coupons)
  
  
  coupons.each do |coupon|
    if cart.keys.include?(coupon[:item])
      counter = 0
      while cart[coupon[:item]][:count] >= coupon[:num]
        cart[coupon[:item]][:count] = cart[coupon[:item]][:count] - coupon[:num]
        cart["#{coupon[:item]} W/COUPON"] = {
          :price => coupon[:cost],
          :clearance => cart[coupon[:item]][:clearance],
          :count => (counter + 1)
        }
        counter = counter + 1
      end
    end
  end
  return cart
end

def apply_clearance(cart)
  cart.each do |item,stats|
    if stat[:clearance] == true
      stat[:price] = stat[:price]*0.8
    end
  end
end

def checkout(cart, coupons)
  # code here
end
