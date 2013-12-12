##Objectives: 
# Create a checkout method to calculate the total cost of a cart of items and apply discounts and coupons as necessary.

# Dr. Steve Bruhle, your green grocer, isn't ready, but you are!
#create a checkout method
#is the item on clearance? Apply 20%
#if you have two of the same item, divide by 20%
#if no item has a price of over
require 'ap'

ITEMS = [{"AVOCADO" => {:price => 3.00, :clearance => true}},
            {"KALE" => {:price => 3.00,:clearance => false}},
            {"BLACK_BEANS" => {:price => 2.50,:clearance => false}},
            {"ALMONDS" => {:price => 9.00, :clearance => false}},
            {"TEMPEH" => {:price => 3.00,:clearance => true}},
            {"CHEESE" => {:price => 6.50,:clearance => false}},
            {"BEER" => {:price => 13.00, :clearance => false}},
            {"PEANUTBUTTER" => {:price => 3.00,:clearance => true}},
            {"BEETS" => {:price => 2.50,:clearance => false}}
        ]

COUPS = [   {:item=>"AVOCADO", :num=>2, :cost=>5.00},
            {:item=>"BEER", :num=>2, :cost=>20.00},
            {:item=>"CHEESE", :num=>3, :cost=>15.00}
        ]

##randomly generates a cart of items

def generateCart
    cart = []
    rand(20).times do
    cart.push(ITEMS.sample)
    end
    ap cart  
end


# #what is an example of what this will output?
# # cart = [{"PEANUTBUTTER"=>{:price=>3.0, :clearance=>true}}
# # {"BEETS"=>{:price=>2.5, :clearance=>false}}
# # {"BLACK_BEANS"=>{:price=>2.5, :clearance=>false}}
# # {"BEER"=>{:price=>13.0, :clearance=>false}}
# # {"BEER"=>{:price=>13.0, :clearance=>false}}
# # {"BLACK_BEANS"=>{:price=>2.5, :clearance=>false}}
# # {"TEMPEH"=>{:price=>3.0, :clearance=>true}}
# # {"BLACK_BEANS"=>{:price=>2.5, :clearance=>false}}]
# # #
# ##randomly generates set of coupons
# def generateCoups
#     coups = []
#     rand(2).times do
#         coups.push(COUPS.sample)
#     end
#     coups
# end


# [{"BEETS"=>{:price=>2.5, :clearance=>false}}, 
#{"BEER"=>{:price=>13.0, :clearance=>false}}, 
#{"ALMONDS"=>{:price=>9.0, :clearance=>false}}, 
#{"CHEESE"=>{:price=>6.5, :clearance=>false}}] 

#this works--it will update the cart to give carts with a discount
def clearance(my_cart)
        my_cart.each do |item|
            #item is a hash, eg: {"TEMPEH"=>{:price=>3.0, :clearance=>true}}
            item.each do |string, hash|
                #into each line of the my cart {:price=>2.5, :clearance=>false}
                if hash[:clearance] == true
                    hash[:price] = hash[:price] * 0.80
                end
                ap my_cart
            end    
        end
end
#clearance(generateCart)

def count_items(my_cart)
    counts = { }
    my_cart.each do |item|
        item.each do |name, attributes|
            counts[name] = my_cart.select{|other_item| other_item ==item }.size
            # if item[name] == counts[name]
            #     attributes[:count]==counts[name]
            # end
            counts.each do |key, value|
                if item[name] == key
                    attributes[:number] = value
                end
                #ap key
                #ap value
                #if key == item[name]
        end
        
    end
       
    end 
    #ap my_cart  
 end
count_items(generateCart)

#count_items = {"PEANUTBUTTER"=>1, "CHEESE"=>1, "BEER"=>1, "ALMONDS"=>1, "AVOCADO"=>1}

def divide_items(my_cart, count)
    my_cart.each do |item|
        #eg item: {"KALE" => { :price => 3.0, :clearance => false }
        item.each do |name, attributes|
            #ap attributes
            #attributes = :price => 2.5,:clearance => false
        end
        #     if item["name"] == count[name]
        #         attributes[:price] = attributes[:price] * 0.8
        #     end
        # end               
    end
end

# count = count_items(generateCart)
# ap count
#divide_items(generateCart, count)


#elements/what to call


    #want to compare items in count items to the items in my cart.
    #will require a conditional statement

# def count_items(my_cart)
#     my_cart.each do |item|
#         count = Hash.new(0)
#         item.each { | v | count.store(v, count[v]+1) }
#     end
#     ap count
# end
# count_items(generateCart)

    #count will have the item and the number of times it is in the array of items


#how many items are in my cart
#want to change the count of items
      


