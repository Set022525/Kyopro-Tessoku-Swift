let input = readLine()!.split(separator: " ").map{Int($0)!}
var count = 0

// for i in 1...input.first! {
//     for j in 1...input.first! {
//         for k in 1...input.first! {
//             if (i + j + k) == input.last! {
//                 count += 1
//             }
//         }
//     }
// }

for i in 1...input.first! {
    for j in 1...input.first! {
            let k = input.last! - i - j;
            if k >= 1 && k <= input.first! {
                count += 1
            }
    }
}


print(count)