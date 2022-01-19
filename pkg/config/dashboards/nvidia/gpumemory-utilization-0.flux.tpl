from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "nvidia_smi")
  |> filter(fn: (r) => r["_field"] == "utilization_memory")
  |> group(columns: ["_measurement"])
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)
  |> sort(columns: ["_time"], desc: false)
  |> yield(name: "last")
  