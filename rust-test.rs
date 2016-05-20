fn factorial(n: f64) -> f64 {
    if n == 0.0 {
      1.0
    } else {
      n * factorial(n - 1.0)
    }
}

fn main() {
    println!("{}", factorial(100f64));
}
