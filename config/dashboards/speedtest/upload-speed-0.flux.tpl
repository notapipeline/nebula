from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "speedtest")
  |> filter(fn: (r) => r["_field"] == "upload_bytes" or r["_field"] == "upload_elapsed")
  |> pivot(
    rowKey:["_time"],
    columnKey: ["_field"],
    valueColumn: "_value"
  )
  |> map(fn: (r) => ({ r with _value: (r.upload_bytes / (r.upload_elapsed / 1000.0)*8.0) }))
  |> group(columns: ["_measurement"])
  |> drop(columns: ["upload_bytes", "upload_elapsed"])
  |> sort(columns:["_time"], desc: false)
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)
