from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "cpu")
  |> filter(fn: (r) => r["_field"] == "usage_idle")
  |> group(columns:["_measurement"])
  |> map(fn: (r) => ({ r with _value: 100.0 - r._value }))
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)
  |> sort(columns: ["_time"], desc: false)
  |> yield(name: "last")