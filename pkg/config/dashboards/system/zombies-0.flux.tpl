import "math"
from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "processes")
  |> filter(fn: (r) => r["_field"] == "zombies")
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)