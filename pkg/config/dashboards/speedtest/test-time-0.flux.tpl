from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "speedtest")
  |> filter(fn: (r) => r["_field"] == "download_elapsed" or r["_field"] == "upload_elapsed")
  |> group(columns: ["_measurement"])
  |> sort(columns: ["_time"], desc: false)
  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)
  |> yield(name: "mean")