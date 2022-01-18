from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "nvidia_smi")
  |> filter(fn: (r) => r["_field"] == "memory_used" or r["_field"] == "memory_total")
  |> pivot(
    rowKey:["_time"],
    columnKey: ["_field"],
    valueColumn: "_value"
  )
  |> map(fn: (r) => ({ r with _value: float(v: r.memory_used) / float(v: r.memory_total) * 100.0 }))
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)
  |> group(columns: ["measurement"])
  |> drop(columns:["memory_total", "memory_used"])
  |> sort(columns: ["_time"], desc: false)
  |> yield(name: "last")