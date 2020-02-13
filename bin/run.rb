require_relative '../config/environment'
require 'pry'

system ("clear")


def menu
    puts "1. See all the users"
    puts "2. See all the items"
    puts "3. See all the order lists from each user"
    puts "4. Add item to user order's list"
    puts "5. Remove item from order's list"
    puts "6. Create a new user"
    puts "7. Delete a user" 
    puts "8. Exit "
end


def user_input
    gets.chomp.to_i
end



def list_all_items
    Item.all.each_with_index do |item,i|
        puts"#{i+1}. #{item.name} "
    end
end


def choose_user(user)
    User.all.find{|users| users.name == user }
end


def find_egg(item)
    Item.all.find{|items| items.name == item}
end

def find_bread(item)
    Item.all.find{|items| items.name == item}
end

def find_milk(item)
    Item.all.find{|items|items.name==item}
end

def create_user(new_user)
    User.create(name: new_user )
end


def display_all_users
    users_map = []
    User.all.each_with_index do |user,i| 
        puts "#{i+1}. #{user.name}"
        users_map << user.id
    end 
    users_map
end

#user_id will always increment but index always the same, so here is some sort of algorithm that make destroy the user_id from the index4
def delete_user(user, users_map)
    user_id = users_map[user - 1]
    User.find(user_id).destroy
end




def select_item (user)
    
    case(user_input)
    # EGG
    when 1
        select_egg=find_egg("Egg")
    
    
       order_egg= Order.all.find do |order|
        # check if order
        if order.user
             order.user.name == user.name && order.item.name == select_egg.name 
        end   
    end

        if  order_egg
            order_egg.quantity=order_egg.quantity+1
            order_egg.save
        else
            order_egg=Order.create(user_id:user.id, item_id: select_egg.id, quantity:1)
        end
        puts  "User: #{user.name}, Item: #{ select_egg.name},$#{ select_egg.price}, quant: #{order_egg.quantity}"
        
    # Bread 
    when 2
        select_bread=find_bread("Bread")

        order_bread= Order.all.find do |order| 
            if order.user
                order.user.name==user.name && order.item.name==select_bread.name
            end
        end

        
        if  order_bread
            order_bread.quantity=order_bread.quantity+1
            order_bread.save
        else
            order_bread=Order.create(user_id:user.id, item_id:select_bread.id, quantity:1)
        end
        puts  "User: #{user.name}, Item: #{select_bread.name},$#{select_bread.price}, quant: #{order_bread.quantity}"
    
    # Milk 
    when 3
        select_milk=find_milk("Milk")

        order_milk= Order.all.find do |order| 
            if order.user
            order.user.name==user.name && order.item.name==select_milk.name
            end
        end
        
        if  order_milk
            order_milk.quantity=order_milk.quantity+1
            order_milk.save
        else
            order_milk=Order.create(user_id:user.id, item_id:select_milk.id, quantity:1)
        end
        puts  "User: #{user.name}, Item: #{select_milk.name},$#{select_milk.price}, quant: #{order_milk.quantity}"

    end

end


def remove_item(user)

    case (user_input)
    #Egg  
    when 1
        select_egg=find_egg("Egg")
    
        order_egg= Order.all.find do |order| 
            if order.user
            order.user.name == user.name && order.item.name == select_egg.name
            end
        end

       if order_egg && order_egg.quantity > 0
            order_egg.quantity=order_egg.quantity-1
            order_egg.save

       elsif order_egg==nil

        order_egg=Order.create(user_id:user.id, item_id:select_egg.id, quantity:0)
        puts "Sorry! there is no egg in #{user.name}'s order !!!"

        else
            puts "Sorry! there is no egg in #{user.name}'s order !!!"

        end
        
        puts  "User: #{user.name}, Item: #{ select_egg.name},$#{ select_egg.price}, quant: #{order_egg.quantity}"

    #Bread   
    when 2 
        select_bread=find_bread("Bread")
    

        order_bread= Order.all.find do |order|
            if order.user
         order.user.name == user.name && order.item.name == select_bread.name
        end
    end


       if order_bread && order_bread.quantity > 0
            order_bread.quantity=order_bread.quantity-1
            order_bread.save
        elsif order_bread==nil
            order_bread=Order.create(user_id:user.id, item_id:select_bread.id, quantity:0)
            puts "Sorry! there is no bread in #{user.name}'s order !!!"
        else
            puts "Sorry! there is no bread in #{user.name}'s order !!!"
        end

        puts  "User: #{user.name}, Item: #{ select_bread.name},$#{ select_bread.price}, quant: #{order_bread.quantity}"

    #Milk    
    when 3
        select_milk=find_milk("Milk")
    

        order_milk= Order.all.find do |order| 
            if order.user
                order.user.name == user.name && order.item.name == select_milk.name 
            end
        end


       if order_milk && order_milk.quantity > 0
            order_milk.quantity=order_milk.quantity-1
            order_milk.save
        elsif order_milk==nil
            order_milk=Order.create(user_id:user.id, item_id:select_milk.id, quantity:0)
            puts "Sorry! there is no milk in #{user.name}'s order !!!"
        else
            puts "Sorry! there is no milk in #{user.name}'s order !!!"
        end

        puts  "User: #{user.name}, Item: #{ select_milk.name},$#{ select_milk.price}, quant: #{order_milk.quantity}"


    end
end













puts "Welcome to the Order list!"
  

def get_user_input
    
    puts "What would you like to do ? "

    menu
    
    case(user_input)

    when 1
        puts "Here are all the users: "
        display_all_users

    when 2
        puts "Here are all the items: "
        list_all_items

    when 3
        puts "Here are all the order lists from each user: "

        Order.all.each do |order| 
            if order.user
            puts  "User: #{order.user.name}, Item: #{order.item.name}, quant: #{order.quantity}"
            end
        end

    when 4

        puts "Please choose a user:  "
        
        display_all_users
     
        user  = choose_user(User.all[user_input-1].name)
                    
        puts "Please choose an item to add into the order list: "
        list_all_items
        
        select_item(user)

            # case (user_input)

                #1 Lebron
                # when 1
                #     user  = choose_user("Lebron")
                    
                #     puts "Please choose an item to add into the order list: "
                #     items
                    
                #     select_item(user)
                
                # #2 Kobe
                # when 2
                #     user = choose_user("Kobe")
            
                #     puts "Please choose an item to add into the order list: "
                #     items
            
                #     select_item(user)

                # #3 Michael
                # when 3
                #     user = choose_user("Michael")
                
                #     puts "Please choose an item to add into the order list: "
                #     items

                #     select_item(user)
                # end
                    
        
    when 5
        puts "Please choose a user:  "

        display_all_users

        user= choose_user(User.all[user_input-1].name)
       
                
        puts "Please choose an item to remove from the order list: "
        list_all_items
        
        remove_item(user)

        # case (user_input)

        #     #1 Lebron
        #     when 1
        #         user  = choose_user("Lebron")
                
        #         puts "Please choose an item to remove from the order list: "
        #         items
                
        #         remove_item(user)
            
        #     #2 Kobe
        #     when 2
        #         user = choose_user("Kobe")
        
        #         puts "Please choose an item to remove from the order list: "
        #         items
        
        #         remove_item(user)

        #     #3 Michael
        #     when 3
        #         user = choose_user("Michael")
            
        #         puts "Please choose an item to remove from the order list: "
        #         items

        #         remove_item(user)
        #     end



    when 6
        puts "Welcome! Create a user name:  "

        user_name= gets.chomp.to_str
        
        create_user(user_name)
    
    


    when 7
        puts "Delete a user: "

        users_map = display_all_users
            
        
        delete_user(user_input, users_map)

    when 8
        return
    end
    
    get_user_input
end

get_user_input

