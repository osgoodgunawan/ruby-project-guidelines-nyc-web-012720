# system ("clear")

# def menu
#     puts "1. See all the users"
#     puts "2. See all the items"
#     puts "3. See all the order lists from each user"
#     puts "4. Add item to user order's list"
#     puts "5. Remove item from order's list"
#     puts "6. Create a new user"
#     puts "7. Delete a user" 
#     puts "8. Exit "
# end

# def users
#     puts "1. Lebron"
#     puts "2. Kobe"
#     puts "3. Michael"
  
# end


# def items
#     puts "1. egg "
#     puts "2. bread" 
#     puts "3. milk"
 
# end


# def user_input
#     gets.chomp.to_i
# end


# def list_all_users
#     User.all.each do |user|
#         puts "#{user.name} || balance= $#{user.account_balance}"
#     end
# end


# def list_all_items
#     Item.all.each do |item|
#         puts"#{item.name}= $#{item.price} "
#     end
# end


# def choose_user(user)
#     User.all.find{|users| users.name == user }
# end


# def find_egg(item)
#     Item.all.find{|items| items.name == item}
# end

# def find_bread(item)
#     Item.all.find{|items| items.name == item}
# end

# def find_milk(item)
#     Item.all.find{|items|items.name==item}
# end

# def create_user(new_user,new_balance)
#     User.create(name: new_user ,account_balance: new_balance)
# end


# def display_all_users
#     users_map = []
#     User.all.each_with_index do |user,i| 
#         puts "#{i+1}. #{user.name}"
#         users_map << user.id
#     end 
#     users_map
# end

# #user_id will always increment but index always the same, so here is some sort of algorithm that make destroy the user_id from the index4
# def delete_user(user, users_map)
#     user_id = users_map[user - 1]
#     User.find(user_id).destroy
# end




# def select_item (user)
    
#     case(user_input)
#     # EGG
#     when 1
#         select_egg=find_egg("Egg")
    

#         order_egg= Order.all.find{|order| order.user.name == user.name && order.item.name == select_egg.name}      

#         if  order_egg
#             order_egg.quantity=order_egg.quantity+1
#             order_egg.save
#         else
#             order_egg=Order.create(user_id:user.id, item_id: select_egg.id, quantity:1)
#         end
#         puts  "User: #{user.name}, Item: #{ select_egg.name},$#{ select_egg.price}, quant: #{order_egg.quantity}"
        
#     # Bread 
#     when 2
#         select_bread=find_bread("Bread")

#         order_bread= Order.all.find{|order| order.user.name==user.name && order.item.name==select_bread.name}

        
#         if  order_bread
#             order_bread.quantity=order_bread.quantity+1
#             order_bread.save
#         else
#             order_bread=Order.create(user_id:user.id, item_id:select_bread.id, quantity:1)
#         end
#         puts  "User: #{user.name}, Item: #{select_bread.name},$#{select_bread.price}, quant: #{order_bread.quantity}"
    
#     # Milk 
#     when 3
#         select_milk=find_milk("Milk")

#         order_milk= Order.all.find{|order| order.user.name==user.name && order.item.name==select_milk.name}

        
#         if  order_milk
#             order_milk.quantity=order_milk.quantity+1
#             order_milk.save
#         else
#             order_milk=Order.create(user_id:user.id, item_id:select_milk.id, quantity:1)
#         end
#         puts  "User: #{user.name}, Item: #{select_milk.name},$#{select_milk.price}, quant: #{order_milk.quantity}"

#     end

# end


# def remove_item(user)

#     case (user_input)
#     #Egg  
#     when 1
#         select_egg=find_egg("Egg")
    

#         order_egg= Order.all.find{|order| order.user.name == user.name && order.item.name == select_egg.name} 

#        if order_egg && order_egg.quantity > 0
#             order_egg.quantity=order_egg.quantity-1
#             order_egg.save

#        elsif order_egg==nil

#         order_egg=Order.create(user_id:user.id, item_id:select_egg.id, quantity:0)
#         puts "Sorry! there is no egg in #{user.name}'s order !!!"

#         else
#             puts "Sorry! there is no egg in #{user.name}'s order !!!"

#         end
        
#         puts  "User: #{user.name}, Item: #{ select_egg.name},$#{ select_egg.price}, quant: #{order_egg.quantity}"

#     #Bread   
#     when 2 
#         select_bread=find_bread("Bread")
    

#         order_bread= Order.all.find{|order| order.user.name == user.name && order.item.name == select_bread.name} 

#        if order_bread && order_bread.quantity > 0
#             order_bread.quantity=order_bread.quantity-1
#             order_bread.save
#         elsif order_bread==nil
#             order_bread=Order.create(user_id:user.id, item_id:select_bread.id, quantity:0)
#             puts "Sorry! there is no bread in #{user.name}'s order !!!"
#         else
#             puts "Sorry! there is no bread in #{user.name}'s order !!!"
#         end

#         puts  "User: #{user.name}, Item: #{ select_bread.name},$#{ select_bread.price}, quant: #{order_bread.quantity}"

#     #Milk    
#     when 3
#         select_milk=find_milk("Milk")
    

#         order_milk= Order.all.find{|order| order.user.name == user.name && order.item.name == select_milk.name} 

#        if order_milk && order_milk.quantity > 0
#             order_milk.quantity=order_milk.quantity-1
#             order_milk.save
#         elsif order_milk==nil
#             order_milk=Order.create(user_id:user.id, item_id:select_milk.id, quantity:0)
#             puts "Sorry! there is no milk in #{user.name}'s order !!!"
#         else
#             puts "Sorry! there is no milk in #{user.name}'s order !!!"
#         end

#         puts  "User: #{user.name}, Item: #{ select_milk.name},$#{ select_milk.price}, quant: #{order_milk.quantity}"


#     end
# end













# puts "Welcome to the Order list!"
  

# def get_user_input
    
#     puts "What would you like to do ? "

#     menu
    
#     case(user_input)

#     when 1
#         puts "Here are all the users: "
#         list_all_users

#     when 2
#         puts "Here are all the items: "
#         list_all_items

#     when 3
#         puts "Here are all the order lists from each user: "

#         Order.all.each do |order| 
#             puts  "User: #{order.user.name}, Item: #{order.item.name}, quant: #{order.quantity}"

#         end

#     when 4

#         puts "Please choose a user:  "
        
#         display_all_users
     
#         user  = choose_user(User.all[user_input-1].name)
                    
#         puts "Please choose an item to add into the order list: "
#         items
        
#         select_item(user)

#             # case (user_input)

#                 #1 Lebron
#                 # when 1
#                 #     user  = choose_user("Lebron")
                    
#                 #     puts "Please choose an item to add into the order list: "
#                 #     items
                    
#                 #     select_item(user)
                
#                 # #2 Kobe
#                 # when 2
#                 #     user = choose_user("Kobe")
            
#                 #     puts "Please choose an item to add into the order list: "
#                 #     items
            
#                 #     select_item(user)

#                 # #3 Michael
#                 # when 3
#                 #     user = choose_user("Michael")
                
#                 #     puts "Please choose an item to add into the order list: "
#                 #     items

#                 #     select_item(user)
#                 # end
                    
        
#     when 5
#         puts "Please choose a user:  "

#         display_all_users

#         user= choose_user(User.all[user_input-1].name)
       
                
#         puts "Please choose an item to remove from the order list: "
#         items
        
#         remove_item(user)

#         # case (user_input)

#         #     #1 Lebron
#         #     when 1
#         #         user  = choose_user("Lebron")
                
#         #         puts "Please choose an item to remove from the order list: "
#         #         items
                
#         #         remove_item(user)
            
#         #     #2 Kobe
#         #     when 2
#         #         user = choose_user("Kobe")
        
#         #         puts "Please choose an item to remove from the order list: "
#         #         items
        
#         #         remove_item(user)

#         #     #3 Michael
#         #     when 3
#         #         user = choose_user("Michael")
            
#         #         puts "Please choose an item to remove from the order list: "
#         #         items

#         #         remove_item(user)
#         #     end



#     when 6
#         puts "Welcome! Create a user name:  "

#         user_name= gets.chomp.to_str
        
#         puts "How much balance you want to put in #{user_name} account ?"

#         user_balance=user_input

#         create_user(user_name,user_balance)
    
    


#     when 7
#         puts "Delete a user: "

#         users_map = display_all_users
            
        
#         delete_user(user_input, users_map)

#     when 8
#         return
#     end
    
#     get_user_input
# end

# get_user_input
