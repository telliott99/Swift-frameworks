import RandFW

srand2(133)
for _ in 0..<3 {
    print(rand2() % 500)
}
print("--------")
srand2(133)
for _ in 0..<3 {
    print(rand2() % 500)
}

let x = rand2()
print(type(of: x))
