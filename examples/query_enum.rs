use std::env::var;
use sqlx::PgConnection;
use sqlx_serde::SerVecPgRow;
use sqlx::Connection;

#[tokio::main]
async fn main() {
    let mut s = PgConnection::connect(var("DATABASE_URL").unwrap().as_str()).await.unwrap();
    let rows = sqlx::query("select source from category").fetch_all(&mut s).await.unwrap();
    let rows: Vec<SerVecPgRow> = rows.into_iter().map(SerVecPgRow::from).collect();
    let rows = serde_json::to_string(&rows).unwrap();
    println!("{}", rows);
}