mod constants;
mod enums;
mod structs;

fn todo(x : Field, y : Field) {
    // TODO: write some basic utils + tests, starting w/ basic order hashing
    assert(x != y);
    assert(enums::OrderType::FULL_OPEN == 0);
}

#[test]
fn test_todo() {
    todo(1, 2);
    // Uncomment to make test fail
    // foo(1, 1);
}
