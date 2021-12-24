Config = {}

Config.Gifts = { --{inventory itemname, amount}
    --money item gives money to the players, other entries are items from inventory config. Make sure to have the itemconfig from below in the inventory2.0 config 
    --MAKE SURE TO ADD YOUR OWN PERSONALIZED GIFTS TO CREATE UNIQUE EXPERIENCE
    {"money",100},
    {"money",20},
    {"money",40},
    {"money",60},
    {"money",80},
    {"money",120},
    {"money",150},
    {"golden_nugget",1},
    {"woodlog",1},
    {"WEAPON_REVOLVER_CATTLEMAN",20},-- for weapon, amount is ammo count
}

--Notification config:
Config.Recieved = "You recieved some gift!"
Config.Title = "Happy Holidays"
