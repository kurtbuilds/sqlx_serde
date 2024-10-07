# sqlx_serde

Check lib.rs for tests, which should give you a clear idea how to use the crate.

```rust
async fn main() {
    let row: PgRow = conn.fetch_one("select 3.3").await.unwrap();
    // option 1 - use function calls
    let headers: Vec<String> = read_headers(&row);
    let row: Vec<serde_json::Value> = read_row(&row);
    // option 2 - serializes as a header -> value map
    let row = SerMapPgRow::from(row);
    let row: serde_json::Value = serde_json::to_value(&row).unwrap();
    // option 3 - serializes as a serde_json::Array
    let row = SerVecPgRow::from(row);
    let row: serde_json::Value = serde_json::to_value(&row).unwrap();
}
```

Look at the `SerMapPgRow` and `SerVecPgRow` structs if you want to use
`#[serialize_with(...)]` on your structs.
