from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "speedtest")
  |> filter(fn: (r) => r["_field"] == "download_bytes" or r["_field"] == "download_elapsed")
  |> pivot(
    rowKey:["_time"],
    columnKey: ["_field"],
    valueColumn: "_value"
  )
  |> map(fn: (r) => ({ r with _value: (r.download_bytes / (r.download_elapsed / 1000.0)*8.0) }))
  |> group(columns: ["_measurement"])
  |> drop(columns: ["download_bytes", "download_elapsed"])
  |> sort(columns:["_time"], desc: false)
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)
