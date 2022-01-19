from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "nvidia_smi")
  |> filter(fn: (r) => r["_field"] == "clocks_current_graphics" or r["_field"] == "clocks_current_memory" or r["_field"] == "clocks_current_sm" or r["_field"] == "clocks_current_video")
  |> group(columns: ["_field"])
  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)
  |> pivot(
    rowKey:["_time"],
    columnKey: ["_field"],
    valueColumn: "_value"
  )
  |> rename(columns: {
    "clocks_current_graphics": "graphics",
    "clocks_current_memory": "memory",
    "clocks_current_sm": "streaming",
    "clocks_current_video": "video",
  })
  |> drop(columns: ["_start", "_stop"])
  |> sort(columns: ["_time"], desc: false)