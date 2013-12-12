ITEMS = [  {"AVOCADO" => {:price => 3.00, :clearance_items => true}},
    {"KALE" => {:price => 3.00,:clearance_items => false}},
    {"BLACK_BEANS" => {:price => 2.50,:clearance_items => false}},
    {"ALMONDS" => {:price => 9.00, :clearance_items => false}},
    {"TEMPEH" => {:price => 3.00,:clearance_items => true}},
    {"CHEESE" => {:price => 6.50,:clearance_items => false}},
    {"BEER" => {:price => 13.00, :clearance_items => false}},
    {"PEANUTBUTTER" => {:price => 3.00,:clearance_items => true}},
    {"BEETS" => {:price => 2.50,:clearance_items => false}}]

COUPS = [  {:item=>"AVOCADO", :num=>2, :cost=>5.00},
    {:item=>"BEER", :num=>2, :cost=>20.00},
    {:item=>"CHEESE", :num=>3, :cost=>15.00}]

#randomly generates a cart of items
def generate_cart
  cart = []
  rand(1..20).times do
    cart.push(ITEMS.sample)  
  end
  cart
end

#randomly generates set of coupons
def generate_coupons
  update_coupons_for_clearance_discount
  coups = []
  rand(2).times do
    coups.push(COUPS.sample)
  end
  update_coupons_for_triple_discount(coups) if coups.size == 2
  coups
end

#updates coupons to reflect discount
def update_coupons_for_clearance_discount
  COUPS.each do |coupon|
    ITEMS.each do |items|
      items.each do |name, attributes|
        coupon[:cost] = coupon[:cost] * 0.8 if coupon[:item] == name && attributes[:clearance_items] == true
      end
    end
  end
end

#update coupons for triple discount
def update_coupons_for_triple_discount(coupons)
  if coupons[0] = coupons[1]
    coupons.delete_at(1)

    coupon = coupons[0]

    ITEMS.each do |items|
      items.each do |name, attributes|
        if coupon[:item] == name
          real_price = attributes[:price] * coupon[:num]
          new_price = coupon[:cost]
          percentage_discount = (real_price - new_price)/real_price
          coupon[:cost] = coupon[:cost] * (1 - (percentage_discount * 3))
        end
      end
    end
  end
  coupons
end

#returns count of items in cart
def count_cart_items(cart)
  counts = {}
  cart.each do |item|
    #each item is smthng like: {"KALE" => {:price => 3.00,:clearance_items => false}},
    item.each do |name, attributes|
      #name = "Avocado" attribute would be {:price => 3.00,:clearance_items => false}
      temp = cart.select{|other_item| other_item == item}.size
      #add a key to counts hash (from the top of the method)
      #select will iterate through everything and do a comparison
      #.size returns the number of elements inside an array
      counts[name] = temp
    end
  end
  counts
end

#adds count to the items in the cart
#update cart so each item has its count in the cart
#remove duplicate items in the cart
# way to write ruby codes--break everything into the smallest possible deliverable
def update_cart_counts(cart, counts)
  cart.uniq!
  #use a bang method, mutilate it in-line
  #could also create a new cart variable instead of altering the cart
  cart.each do |item|
    item.each do |name, attributes|
      #key is avocado, value is a hash
      counts.each do |item2, number|
        #item2 is something like Avocade and number is something like 2
        #both are different hashes, so they can have the same keys (aka Avocados refer to different lists)
        attributes[:count] = number if item2 == name
      end
    end
  end
end

#changes price for couponed items
#alter coupons themselves to respect rules 
#this is not exactly how i thought about it
#another way to do it is to drop coupons that don't apply
#this takes two parameters, cart (an array, and coupons, an array)
def coupon_items(cart, coupons)
  return 0 if coupons.nil?
  cost = 0
  cart.each do |item|
    #want to make sure we have the minimum number of items
    item.each do |name, attributes|
      unless coupons.nil?
        coupons.each do |coupon|
          if name == coupon[:item] && attributes[:count] >= coupon[:num]
            #add the item to our total cost
            cost += coupon[:cost] * (attributes[:count]/coupon[:num])
            #so we've paid for the number of items reflected in the coupon
            #in the checkout, remove item fromthe cart
            attributes[:count] = attributes[:count] - coupon[:num]
            #this is the remainder...
          end
        end
      end
    end
  end
  cost
end

#gives clearance_items discount
def clearance_items(cart, cost)
  cart.each do |item|
    item.each do |name, attribute|
      if attribute[:clearance]
        cost += (attribute[:price] * attribute[:count]) * 0.8
        #this does not take into account the number of items YET
        attribute[:count] = 0
      end
    end
  end
  cost
end

#gives cost of normal items
def full_price_items(cart, cost)
  cart.each do |item|
    item.each do |name,attribute|
      cost += (attribute[:price] * attribute[:count])
    end
  end
  cost
end

#gives over 5 discount
def over_5_discount(cart, cost)
  over_5 = false

  cart.each do |item|
    item.each do |name, attribute| 
      over_5 = true if attribute[:price] > 5
    end
  end

  over_5 || cost <= 10 ? cost : cost - 10
end

def checkout(cart, coupons)
  no_coupons = coupon_items(cart, coupons)
  clearance_items = clearance_items(cart, no_coupons)
  total = full_price_items(cart, clearance_items)
  over_5_discount(cart, total)
end
