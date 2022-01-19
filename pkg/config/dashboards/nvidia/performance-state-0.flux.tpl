import "strings"

from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "nvidia_smi" and r["_field"] == "utilization_gpu")
  |> drop(columns: ["_value"])
  |> rename(columns: {"pstate": "_value"})
  |> group(columns: ["_measurement"])
  |> map(fn: (r) => ({
      r with _value: strings.trim(v: r._value, cutset: "P")
    })
  )
  |> keep(columns: ["_time", "_value"])
  |> sort(columns: ["_time"], desc: false)
  |> drop(columns: ["_time"])
|> toInt()
|> last()