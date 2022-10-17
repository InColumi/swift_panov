protocol INotifier {
    func notify()
}


class Player: INotifier {
    var maxNumber: Int
    var name: String
    var cardSize: Int
    var card: Array<Int>

    init(cardSize: Int = 5, name: String, maxNumber: Int = 90){
        self.cardSize = cardSize
        self.name = name
        self.maxNumber = maxNumber
        self.card = Array<Int>()
        getRandomNumbers()
    }

    func checkNumber(number: Int) -> Bool {
        if (self.card.count > 0) {
            if let index = self.card.firstIndex(of: number) {
                self.card.remove(at: index)
            }
            return false
        }
        else{
            notify()
            return true
        }
    }
    
    
    func notify(){
        print("I win" + name)
    }

    func getRandomNumbers(){
        while self.card.count < self.cardSize {

            self.card.insert(Int.random(in: 1...100), at: 0)
        }
    }
}


class Publisher {
    var sizeCard: Int
    var numbers: Array<Int>

    init(sizeCard: Int = 5){
        self.sizeCard = sizeCard
        let n = Array(0...self.sizeCard)
        self.numbers = (n as Array).shuffled() as! [Int]
    }

    func publish() -> Int{
        var newNumber: Int = -1
        if (self.numbers.isEmpty == false){
            newNumber = self.numbers.removeLast()
        }
        return newNumber
    } 
}


func main(){
    
}

main()