import "strings"

from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "cpu")
  |> filter(fn: (r) => r["_field"] == "usage_guest" or r["_field"] == "usage_guest_nice" or r["_field"] == "usage_iowait" or r["_field"] == "usage_irq" or r["_field"] == "usage_nice" or r["_field"] == "usage_softirq" or r["_field"] == "usage_steal" or r["_field"] == "usage_system")
  |> filter(fn: (r) => r["cpu"] == "cpu-total")
  |> map(fn: (r) => ({ r with _field: strings.replace(v: r._field, t: "usage_", u: "", i: 1)}))
  |> drop(columns: ["cpu", "host"])
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)
  |> yield(name: "last")