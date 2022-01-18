import "influxdata/influxdb/schema"
data = from(bucket: "nebula")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "speedtest")

ping = data
  |> filter(fn: (r) => r["_field"] == "ping_latency")
  |> aggregateWindow(every: v.windowPeriod, fn: max, createEmpty: false)
  |> mean()
ping

download = data 
  |> filter(fn: (r) => r["_field"] == "download_bytes" or r["_field"] == "download_elapsed")
  |> pivot(
    rowKey:["_time"],
    columnKey: ["_field"],
    valueColumn: "_value"
  )
  |> map(fn: (r) => ({ r with _value: (r.download_bytes / (r.download_elapsed / 1000.0)*8.0) }))
  |> aggregateWindow(every: v.windowPeriod, fn: max, createEmpty: false)
  |> drop(columns: ["download_bytes", "download_elapsed"])
  |> mean()
download

upload = data
  |> filter(fn: (r) => r["_field"] == "upload_bytes" or r["_field"] == "upload_elapsed")
  |> pivot(
    rowKey:["_time"],
    columnKey: ["_field"],
    valueColumn: "_value"
  )
  |> map(fn: (r) => ({ r with _value: (r.upload_bytes / (r.upload_elapsed / 1000.0)*8.0) }))
  |> aggregateWindow(every: v.windowPeriod, fn: max, createEmpty: false)
  |> drop(columns: ["upload_bytes", "upload_elapsed"])
  |> mean()
  |> mean()

intermediate = join(
    tables: {download:download, upload:upload},
    on: ["server_name"],
    method: "inner"
)

join(
    tables: {intermediate:intermediate, ping:ping},
    on: ["server_name"],
    method: "inner"
)
|> rename(columns: {
        "server_location": "Location",
        "server_name": "Server",
        "_value_download": "Download Avg",
        "_value_upload": "Upload Avg",
        "_value": "Ping",
  })
  |> keep(columns:["Server", "Location", "Download Avg", "Upload Avg", "Ping"])
  |> group(columns: ["Server"], mode:"by")
  |> group()