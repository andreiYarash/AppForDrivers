import Foundation



protocol NewsMain {
    var newsText:[String]{get}
    
    var titleNews:[String]{get}
    
    
    
    
    
}

public class News:NewsMain{

    var titleNews: [String] = [
        
        "Service Offer",
        "Fuel Offer",
        "Congestion",
        "Tip Drivers ",
        "Situation On The Road",
        "Hot Offer",
        "Tesla and Cars",
        "Belarus develop new project",
        "Good Tip!",
        "Crash,Warning!!!"
        ]
    
    var newsText: [String] =  [
        "Winter tires with 50% discount,CircleService",
        "Your Tank is empty? Belorusneft helps you.New discounts",
        "Big congestion on Independence square",
        "Strong rain,be more careful!",
        "Crash on Prititskogo Street",
        "Buy More 50 liters and get  Discount on A-100",
        "Tesla has updated the model range of car",
        "Belarus has designed  electric car",
        "Driver,Be More careful",
        "Big Crash on Mogilovka Highway"
       ]
    
    var imageNews:[String] = [
    
    "0",
    "0",
    "3",
    "3",
    "2",
    "0",
    "0",
    "0",
    "0",
    "2"
    
    
    
    ]
    
    var point:String = "point"
        
    
        
        
    
}

