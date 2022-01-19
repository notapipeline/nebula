{
    "annotations": {
        "list": [
            {
                "builtIn": 1,
                "datasource": "-- Grafana --",
                "enable": true,
                "hide": true,
                "iconColor": "rgba(0, 211, 255, 1)",
                "name": "Annotations \u0026 Alerts",
                "target": {
                    "limit": 100,
                    "matchAny": false,
                    "tags": [],
                    "type": "dashboard"
                },
                "type": "dashboard"
            }
        ]
    },
    "description": "A dashboard to display speedtest data overtime. ",
    "editable": true,
    "fiscalYearStartMonth": 0,
    "gnetId": 13053,
    "graphTooltip": 0,
    "id": 1,
    "links": [],
    "liveNow": false,
    "panels": [
        {
            "collapsed": false,
            "datasource": "InfluxDB",
            "gridPos": {
                "h": 1,
                "w": 24,
                "x": 0,
                "y": 0
            },
            "id": 108,
            "panels": [],
            "title": "SpeedTest",
            "type": "row"
        },
        {
            "datasource": "InfluxDB",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "red",
                                "value": null
                            },
                            {
                                "color": "#EAB839",
                                "value": 200
                            },
                            {
                                "color": "green",
                                "value": 400
                            }
                        ]
                    },
                    "unit": "bps"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 4,
                "w": 6,
                "x": 0,
                "y": 1
            },
            "id": 116,
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "center",
                "orientation": "auto",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "text": {},
                "textMode": "auto"
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "linear"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "download",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ download-speed-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "bandwidth"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "last"
                            }
                        ]
                    ],
                    "tags": []
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Download Speed",
            "type": "stat"
        },
        {
            "datasource": "InfluxDB",
            "fieldConfig": {
                "defaults": {
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "red",
                                "value": null
                            },
                            {
                                "color": "light-yellow",
                                "value": 200
                            },
                            {
                                "color": "green",
                                "value": 400
                            }
                        ]
                    },
                    "unit": "Bps"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 4,
                "w": 6,
                "x": 6,
                "y": 1
            },
            "id": 118,
            "interval": "",
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "auto",
                "orientation": "auto",
                "reduceOptions": {
                    "calcs": [
                        "mean"
                    ],
                    "fields": "",
                    "values": false
                },
                "text": {},
                "textMode": "auto"
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "linear"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "upload",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ upload-speed-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "bandwidth"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "last"
                            }
                        ]
                    ],
                    "tags": []
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Upload Speed",
            "type": "stat"
        },
        {
            "datasource": "InfluxDB",
            "fieldConfig": {
                "defaults": {
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            },
                            {
                                "color": "red",
                                "value": 80
                            }
                        ]
                    },
                    "unit": "ms"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 4,
                "w": 6,
                "x": 12,
                "y": 1
            },
            "id": 120,
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "auto",
                "orientation": "auto",
                "reduceOptions": {
                    "calcs": [
                        "mean"
                    ],
                    "fields": "",
                    "values": false
                },
                "text": {},
                "textMode": "auto"
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "linear"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "ping",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ response-time-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "latency"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "mean"
                            }
                        ]
                    ],
                    "tags": []
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Response Time",
            "type": "stat"
        },
        {
            "datasource": "InfluxDB",
            "fieldConfig": {
                "defaults": {
                    "decimals": 2,
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            },
                            {
                                "color": "yellow",
                                "value": 15000
                            },
                            {
                                "color": "red",
                                "value": 20000
                            }
                        ]
                    },
                    "unit": "ms"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 4,
                "w": 6,
                "x": 18,
                "y": 1
            },
            "id": 122,
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "auto",
                "orientation": "auto",
                "reduceOptions": {
                    "calcs": [
                        "mean"
                    ],
                    "fields": "",
                    "values": false
                },
                "text": {},
                "textMode": "auto"
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "linear"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "download",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ test-time-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "elapsed"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "mean"
                            }
                        ]
                    ],
                    "tags": []
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Test Time",
            "type": "stat"
        },
        {
            "datasource": "InfluxDB",
            "fieldConfig": {
                "defaults": {
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            }
                        ]
                    },
                    "unit": "decbytes"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 4,
                "w": 6,
                "x": 0,
                "y": 5
            },
            "id": 124,
            "interval": "1h",
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "auto",
                "orientation": "auto",
                "reduceOptions": {
                    "calcs": [
                        "sum"
                    ],
                    "fields": "",
                    "values": false
                },
                "text": {},
                "textMode": "auto"
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "previous"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "download",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ download-size-total-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "bytes"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "last"
                            }
                        ]
                    ],
                    "tags": []
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Download Size Total",
            "type": "stat"
        },
        {
            "datasource": "InfluxDB",
            "description": "Uses https://github.com/breadlysm/speedtest-to-influxdb",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "palette-classic"
                    },
                    "custom": {
                        "axisLabel": "",
                        "axisPlacement": "auto",
                        "barAlignment": 0,
                        "drawStyle": "line",
                        "fillOpacity": 0,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "linear",
                        "lineWidth": 1,
                        "pointSize": 5,
                        "scaleDistribution": {
                            "type": "linear"
                        },
                        "showPoints": "auto",
                        "spanNulls": false,
                        "stacking": {
                            "group": "A",
                            "mode": "none"
                        },
                        "thresholdsStyle": {
                            "mode": "off"
                        }
                    },
                    "displayName": "${__field.name}",
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            },
                            {
                                "color": "red",
                                "value": 80
                            }
                        ]
                    },
                    "unit": "Bps"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 8,
                "w": 18,
                "x": 6,
                "y": 5
            },
            "id": 104,
            "interval": "",
            "options": {
                "legend": {
                    "calcs": [],
                    "displayMode": "list",
                    "placement": "bottom"
                },
                "tooltip": {
                    "mode": "single"
                }
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "alias": "Download",
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "none"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "download",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ average-speedtest-results-0 }}",
                    "rawQuery": false,
                    "refId": "Download",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "bandwidth"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "last"
                            }
                        ]
                    ],
                    "tags": []
                },
                {
                    "alias": "Upload",
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "none"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "upload",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ average-speedtest-results-1 }}",
                    "rawQuery": false,
                    "refId": "Upload",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "bandwidth"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "last"
                            }
                        ]
                    ],
                    "tags": []
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Average speedtest results",
            "type": "timeseries"
        },
        {
            "datasource": "InfluxDB",
            "fieldConfig": {
                "defaults": {
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            }
                        ]
                    },
                    "unit": "decbytes"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 4,
                "w": 6,
                "x": 0,
                "y": 9
            },
            "id": 125,
            "interval": "1h",
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "auto",
                "orientation": "auto",
                "reduceOptions": {
                    "calcs": [
                        "sum"
                    ],
                    "fields": "",
                    "values": false
                },
                "text": {},
                "textMode": "auto"
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "previous"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "upload",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ upload-size-total-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "bytes"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "last"
                            }
                        ]
                    ],
                    "tags": []
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Upload Size Total",
            "type": "stat"
        },
        {
            "datasource": "InfluxDB",
            "description": "Shows the avg speeds received by test site",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "custom": {
                        "align": null,
                        "displayMode": "color-background"
                    },
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            }
                        ]
                    },
                    "unit": "Bps"
                },
                "overrides": [
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "Ping"
                        },
                        "properties": [
                            {
                                "id": "unit",
                                "value": "ms"
                            },
                            {
                                "id": "thresholds",
                                "value": {
                                    "mode": "absolute",
                                    "steps": [
                                        {
                                            "color": "green",
                                            "value": null
                                        },
                                        {
                                            "color": "#EAB839",
                                            "value": 8
                                        },
                                        {
                                            "color": "red",
                                            "value": 25
                                        }
                                    ]
                                }
                            },
                            {
                                "id": "custom.displayMode",
                                "value": "gradient-gauge"
                            },
                            {
                                "id": "max",
                                "value": 100
                            },
                            {
                                "id": "custom.width",
                                "value": 200
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "Location"
                        },
                        "properties": [
                            {
                                "id": "custom.displayMode",
                                "value": "auto"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "Download Avg"
                        },
                        "properties": [
                            {
                                "id": "custom.displayMode",
                                "value": "gradient-gauge"
                            },
                            {
                                "id": "thresholds",
                                "value": {
                                    "mode": "percentage",
                                    "steps": [
                                        {
                                            "color": "red",
                                            "value": null
                                        },
                                        {
                                            "color": "yellow",
                                            "value": 50
                                        },
                                        {
                                            "color": "green",
                                            "value": 80
                                        }
                                    ]
                                }
                            },
                            {
                                "id": "min"
                            },
                            {
                                "id": "max"
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "Upload Avg"
                        },
                        "properties": [
                            {
                                "id": "custom.displayMode",
                                "value": "gradient-gauge"
                            },
                            {
                                "id": "min",
                                "value": 100
                            },
                            {
                                "id": "max"
                            },
                            {
                                "id": "thresholds",
                                "value": {
                                    "mode": "percentage",
                                    "steps": [
                                        {
                                            "color": "red",
                                            "value": null
                                        },
                                        {
                                            "color": "yellow",
                                            "value": 50
                                        },
                                        {
                                            "color": "green",
                                            "value": 80
                                        }
                                    ]
                                }
                            },
                            {
                                "id": "custom.width",
                                "value": 200
                            }
                        ]
                    },
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "Server"
                        },
                        "properties": [
                            {
                                "id": "custom.displayMode",
                                "value": "auto"
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 13,
                "w": 24,
                "x": 0,
                "y": 13
            },
            "id": 114,
            "options": {
                "showHeader": true,
                "sortBy": [
                    {
                        "desc": true,
                        "displayName": "Download Avg"
                    }
                ]
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "groupBy": [
                        {
                            "params": [
                                "server_name"
                            ],
                            "type": "tag"
                        },
                        {
                            "params": [
                                "server_location"
                            ],
                            "type": "tag"
                        },
                        {
                            "params": [
                                "server_id"
                            ],
                            "type": "tag"
                        }
                    ],
                    "measurement": "download",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ avg-speed-by-test-server-0 }}",
                    "rawQuery": false,
                    "refId": "A",
                    "resultFormat": "table",
                    "select": [
                        [
                            {
                                "params": [
                                    "bandwidth"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "mean"
                            },
                            {
                                "params": [
                                    "Download Avg"
                                ],
                                "type": "alias"
                            }
                        ],
                        [
                            {
                                "params": [
                                    "bandwidth"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "count"
                            },
                            {
                                "params": [
                                    "Test Count"
                                ],
                                "type": "alias"
                            }
                        ]
                    ],
                    "tags": []
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Avg. Speed by test server",
            "transformations": [
                {
                    "id": "organize",
                    "options": {
                        "excludeByName": {},
                        "indexByName": {
                            "Download Avg": 2,
                            "Location": 1,
                            "Ping": 4,
                            "Server": 0,
                            "Upload Avg": 3
                        },
                        "renameByName": {}
                    }
                }
            ],
            "type": "table"
        }
    ],
    "refresh": "",
    "schemaVersion": 32,
    "style": "dark",
    "tags": [],
    "templating": {
        "list": []
    },
    "time": {
        "from": "now-24h",
        "to": "now"
    },
    "timepicker": {
        "refresh_intervals": [
            "5s",
            "10s",
            "30s",
            "1m",
            "5m",
            "15m",
            "30m",
            "1h",
            "2h",
            "1d"
        ]
    },
    "timezone": "",
    "title": "SpeedTest",
    "uid": "kLXTiedGz",
    "version": 14
}