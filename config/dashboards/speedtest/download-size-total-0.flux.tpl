from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "speedtest")
  |> filter(fn: (r) => r["_field"] == "download_bytes")
  |> group (columns: ["_measurement"])
  |> sort(columns: ["_time"], desc: false)
  |> aggregateWindow(every: v.windowPeriod, fn: sum, createEmpty: false)
  |> yield(name: "sum")