use std::env;
use std::hint::black_box;

fn main() {
    let x: f32 = env::args().count() as f32;
    for _ in 0..100000000 {
        let _ = black_box(1.0 / black_box(x).sqrt());
    }
}
