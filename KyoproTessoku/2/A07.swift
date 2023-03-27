//normal
let eventPeriod = Int(readLine()!)!
let numAttendees = Int(readLine()!)!
var totalAttendeesPerDay = [Int](repeating: 0, count: eventPeriod+1)

for _ in 1...numAttendees {
    let attendanceDate = readLine()!.split(separator: " ").map{Int($0)!} //[Li, Ri]
    for i in attendanceDate.first!...attendanceDate.last!{
    totalAttendeesPerDay[i-1] += 1;
    }
}

totalAttendeesPerDay.forEach{print($0)}

//imosu method
let eventPeriod = Int(readLine()!)!
let numAttendees = Int(readLine()!)!
var diffAttendees = [Int](repeating: 0, count: eventPeriod)
var totalAttendeesPerDay = [0]
for _ in 1...numAttendees {
    let attendanceDate = readLine()!.split(separator: " ").map{Int($0)!} //[Li, Ri]
    diffAttendees[attendanceDate.first!-1] += 1
    diffAttendees[attendanceDate.last!] -= 1
}
for i in 1...eventPeriod {
    totalAttendeesPerDay.append(totalAttendeesPerDay[i-1] + diffAttendees[i-1])
}

totalAttendeesPerDay.dropFirst().forEach{print($0)}