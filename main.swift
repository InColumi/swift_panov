class Publisher {
    var sizeCard: Int
    var numbers: Array<Int>

    init(sizeCard: Int = 5){
        self.sizeCard = sizeCard
        let n = Array(0...90)
        self.numbers = (n as Array).shuffled() as! [Int]
    }

    func publish() -> Int{
        return self.numbers.removeLast()
    } 
}


func main(){
    let publisher: Publisher = Publisher()
    print(publisher.numbers)
}

main()