use tokio;
use warp::{self, Filter};

#[tokio::main]
async fn main() {
    let hello = warp::path!("hello" / String).map(|name| format!("Hello, {}!", name));

    warp::serve(hello).run(([0, 0, 0, 0], 8080)).await
}
