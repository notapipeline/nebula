total = from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "disk")
  |> filter(fn: (r) => r["_field"] == "total")
  |> last()
  |> pivot(
    rowKey:["_time"],
    columnKey: ["_field"],
    valueColumn: "_value"
  )
  |> group()
  |> keep(columns: ["device", "path", "total"])

free = from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "disk")
  |> filter(fn: (r) => r["_field"] == "free")
  |> last()
  |> pivot(
    rowKey:["_time"],
    columnKey: ["_field"],
    valueColumn: "_value"
  )
  |> group()
  |> keep(columns: ["device", "path", "free"])

join(
  tables: { a:free, b:total },
  on: ["device", "path"],
  method: "inner"
)
|> map(fn: (r) => ({ r with _value: 100.0 - ((float(v: r.free) / float(v: r.total)) * 100.0) }))
|> drop(columns: ["free", "total"])
|> rename(columns: {
  "_value": "used",
})