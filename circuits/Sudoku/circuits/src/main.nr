use dep::std;

// Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

//     "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
//                                                                                    [0, 0, 1, 0]
//                                                                                    [0, 0, 0, 3]
//                                                                                    [2, 0, 0, 0]

//     "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
//                                                                                    [3, 2, 1, 4]
//                                                                                    [4, 1, 2, 3]
//                                                                                    [2, 3, 4, 1]

fn main(question: pub [Field; 16], answer : [Field; 16]) -> pub bool {
       
    // Verifying the Question
    for i in 0..16 {
        let mut a = question[i] == answer[i];
        let mut b = question[i] == 0;
        let c = a | b;
        std::println(c);
        assert(c == true);
    }

// Check first row has 3 inputs as 0 and 1 input as non zero
    let mut m:[Field; 16] = [0; 16];
    let mut sum:[u64; 8] = [0; 8];
    let mut faults: u64 = 0;
    for i in 0..4 {
    sum[0] += answer[i] as u64;
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[0] + m[1] +m[2] + m[3]));

// Check second row has 3 inputs as 0 and 1 input as non zero

    for i in 4..8 {
    sum[1] += answer[i] as u64;
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[4] + m[5] +m[6] + m[7]));

// Check third row has 3 inputs as 0 and 1 input as non zero

    for i in 8..12 {
    sum[2] += answer[i] as u64;
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[8] + m[9] +m[10] + m[11]));

// Check fourth row has 3 inputs as 0 and 1 input as non zero

    for i in 12..16 {
    sum[3] += answer[i] as u64;
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[12] + m[13] +m[14] + m[15]));

    for i in 0..4 {
        sum[4] += answer[i * 4] as u64;
        sum[5] += answer[i * 4 + 1] as u64;
        sum[6] += answer[i * 4 + 2] as u64;
        sum[7] += answer[i * 4 + 3] as u64;
    }

    for i in 0..8 {
        assert(sum[i] == 10);
        if sum[i] != 10 {
            faults += 1;
        }
    }

    if faults == 0 {
        true
    } else {
        false
    }

}

