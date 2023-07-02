use dep::std;
// Create a 3 x 3 Sujiko Verifier circuit 

/// Question will be in the form of  
/// q[0]  q[1]
/// q[2]  q[3]

/// solution will be in the form of 
/// s[0]  s[1]  s[2]
/// s[3]  s[4]  s[5]
/// s[6]  s[7]  s[8]


fn main(question: pub [Field; 4], solution:[Field; 9]) -> pub bool {
   
    let mut faults = 0;
    let mut q:[Field; 4] = [0; 4];
    q[0] = solution[0] + solution[1] + solution[3] + solution[4];
    q[1] = solution[1] + solution[2] + solution[4] + solution[5];
    q[2] = solution[3] + solution[4] + solution[6] + solution[7];
    q[3] = solution[4] + solution[5] + solution[7] + solution[8];

    for i in 0..4 {
        assert(is_equal(q[i], question[i]));
        if !is_equal(q[i], question[i]) {
            faults += 1;
        }
    }

    if faults == 0 {
        true
    } else {
        false
    }

}

// Helper function
fn is_equal(a:Field, b:Field) -> pub bool {
    let z = a == b;
    let m = false;
    z| m 
}
