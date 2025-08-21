fn main(x: Field, y: Field) -> pub Field {
    // Constraint 1: product must equal 42
    assert(x * y == 42);

    // Constraint 2: sum is computed
    let sum = x + y;

    // Return the sum as a public output (can be verified on-chain, for example)
    sum
}
#[test]
fn test_valid_factors_6_and_7() {
    // 6 * 7 = 42, sum = 13
    let x = 6;
    let y = 7;
    let sum = main(x, y);
    assert(sum == 13);
}

#[test]
fn test_valid_factors_21_and_2() {
    // 21 * 2 = 42, sum = 23
    let x = 21;
    let y = 2;
    let sum = main(x, y);
    assert(sum == 23);
}

#[test]
fn test_valid_factors_negative_6_and_negative_7() {
    // (-6) * (-7) = 42, sum = -13
    let x = -6;
    let y = -7;
    let sum = main(x, y);
    assert(sum == -13);
}

#[test(should_fail)]
fn test_invalid_factors_should_fail() {
     //5 * 8 != 42, should fail 
     let x = 5;
     let y = 8;
     let sum = main(x, y);
     assert(sum == 13);
}
#[test(should_fail)]
fn test_invalid_sum_should_fail() {
     //7 + 6 != 10, should fail 
     let x = 7;
     let y = 6;
     let sum = main(x, y);
     assert(sum == 10);
}