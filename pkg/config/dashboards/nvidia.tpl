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
    "description": "Nvidia Graphics cards",
    "editable": true,
    "fiscalYearStartMonth": 0,
    "gnetId": 11900,
    "graphTooltip": 1,
    "id": 4,
    "links": [],
    "liveNow": false,
    "panels": [
        {
            "collapsed": false,
            "datasource": null,
            "gridPos": {
                "h": 1,
                "w": 24,
                "x": 0,
                "y": 0
            },
            "id": 26,
            "panels": [],
            "repeat": "GPU",
            "title": "Overview",
            "type": "row"
        },
        {
            "cacheTimeout": null,
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "max": 100,
                    "min": 0,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "#299c46",
                                "value": null
                            },
                            {
                                "color": "rgba(237, 129, 40, 0.89)",
                                "value": 60
                            },
                            {
                                "color": "#d44a3a",
                                "value": 90
                            }
                        ]
                    },
                    "unit": "percent"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 3,
                "x": 0,
                "y": 1
            },
            "id": 22,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "orientation": "horizontal",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "showThresholdLabels": false,
                "showThresholdMarkers": true,
                "text": {}
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
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ gpu-utilization-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "utilization_gpu"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=",
                            "value": "GeForce GTX 1070"
                        }
                    ]
                }
            ],
            "title": "GPU Utilization",
            "type": "gauge"
        },
        {
            "cacheTimeout": null,
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "max": 100,
                    "min": 0,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "#299c46",
                                "value": null
                            },
                            {
                                "color": "rgba(237, 129, 40, 0.89)",
                                "value": 60
                            },
                            {
                                "color": "#d44a3a",
                                "value": 90
                            }
                        ]
                    },
                    "unit": "percent"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 3,
                "x": 3,
                "y": 1
            },
            "id": 27,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "orientation": "horizontal",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "showThresholdLabels": false,
                "showThresholdMarkers": true,
                "text": {}
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
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ gpumemory-utilization-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "utilization_memory"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=",
                            "value": "GeForce GTX 1070"
                        }
                    ]
                }
            ],
            "title": "GPU-Memory Utilization",
            "type": "gauge"
        },
        {
            "cacheTimeout": null,
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "max": 100,
                    "min": 0,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "#299c46",
                                "value": null
                            },
                            {
                                "color": "rgba(237, 129, 40, 0.89)",
                                "value": 65
                            },
                            {
                                "color": "#d44a3a",
                                "value": 85
                            }
                        ]
                    },
                    "unit": "celsius"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 3,
                "x": 6,
                "y": 1
            },
            "id": 28,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "orientation": "horizontal",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "showThresholdLabels": false,
                "showThresholdMarkers": true,
                "text": {}
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
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ gputemperature-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "temperature_gpu"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=",
                            "value": "GeForce GTX 1070"
                        }
                    ]
                }
            ],
            "title": "GPU-Temperature",
            "type": "gauge"
        },
        {
            "cacheTimeout": null,
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "max": 100,
                    "min": 0,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "#299c46",
                                "value": null
                            },
                            {
                                "color": "rgba(237, 129, 40, 0.89)",
                                "value": 60
                            },
                            {
                                "color": "#d44a3a",
                                "value": 90
                            }
                        ]
                    },
                    "unit": "percent"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 3,
                "x": 9,
                "y": 1
            },
            "id": 29,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "orientation": "horizontal",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "showThresholdLabels": false,
                "showThresholdMarkers": true,
                "text": {}
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
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ fan-speed-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "fan_speed"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=",
                            "value": "GeForce GTX 1070"
                        }
                    ]
                }
            ],
            "title": "Fan Speed",
            "type": "gauge"
        },
        {
            "cacheTimeout": null,
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "fixedColor": "rgb(31, 120, 193)",
                        "mode": "fixed"
                    },
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "#299c46",
                                "value": null
                            },
                            {
                                "color": "rgba(237, 129, 40, 0.89)",
                                "value": 60
                            },
                            {
                                "color": "#d44a3a",
                                "value": 90
                            }
                        ]
                    },
                    "unit": "MHs"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 12,
                "w": 12,
                "x": 12,
                "y": 1
            },
            "id": 30,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "colorMode": "none",
                "graphMode": "area",
                "justifyMode": "auto",
                "orientation": "horizontal",
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
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ gpuclocks-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "clocks_current_graphics"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=",
                            "value": "GeForce GTX 1070"
                        }
                    ]
                }
            ],
            "title": "GPU-Clocks",
            "type": "stat"
        },
        {
            "cacheTimeout": null,
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "max": 155,
                    "min": 0,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "#299c46",
                                "value": null
                            },
                            {
                                "color": "rgba(237, 129, 40, 0.89)",
                                "value": 80
                            },
                            {
                                "color": "#d44a3a",
                                "value": 130
                            }
                        ]
                    },
                    "unit": "watt"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 3,
                "x": 0,
                "y": 7
            },
            "id": 32,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "orientation": "horizontal",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "showThresholdLabels": false,
                "showThresholdMarkers": true,
                "text": {}
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
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ gpupowerdraw-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "power_draw"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=",
                            "value": "GeForce GTX 1070"
                        }
                    ]
                }
            ],
            "title": "GPU-Power-Draw",
            "type": "gauge"
        },
        {
            "cacheTimeout": null,
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "max": 100,
                    "min": 0,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "#299c46",
                                "value": null
                            },
                            {
                                "color": "rgba(237, 129, 40, 0.89)",
                                "value": 50
                            },
                            {
                                "color": "#d44a3a",
                                "value": 80
                            }
                        ]
                    },
                    "unit": "percent"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 3,
                "x": 3,
                "y": 7
            },
            "id": 33,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "orientation": "horizontal",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "showThresholdLabels": false,
                "showThresholdMarkers": true,
                "text": {}
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
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ gpumemory-used-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "memory_used"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=",
                            "value": "GeForce GTX 1070"
                        }
                    ]
                }
            ],
            "title": "GPU-Memory USED",
            "type": "gauge"
        },
        {
            "cacheTimeout": null,
            "datasource": "InfluxDB",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "max": 100,
                    "min": 0,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "rgba(0, 230, 255, 0.97)",
                                "value": null
                            },
                            {
                                "color": "rgba(0, 146, 255, 0.89)",
                                "value": 70
                            },
                            {
                                "color": "#052b51",
                                "value": 90
                            }
                        ]
                    },
                    "unit": "percent"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 2,
                "x": 6,
                "y": 7
            },
            "id": 35,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "orientation": "horizontal",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "showThresholdLabels": false,
                "showThresholdMarkers": true,
                "text": {}
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "hide": false,
                    "query": "{{ cpu-usage-0 }}",
                    "refId": "A"
                }
            ],
            "title": "CPU Usage",
            "type": "gauge"
        },
        {
            "cacheTimeout": null,
            "datasource": "InfluxDB",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "decimals": 1,
                    "mappings": [
                        {
                            "options": {
                                "match": "null",
                                "result": {
                                    "text": "N/A"
                                }
                            },
                            "type": "special"
                        }
                    ],
                    "max": 67342147584,
                    "min": 0,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "rgba(245, 54, 54, 0.9)",
                                "value": null
                            },
                            {
                                "color": "rgba(0, 110, 255, 0.89)",
                                "value": 1000000000
                            },
                            {
                                "color": "rgba(0, 254, 255, 0.97)",
                                "value": 2000000000
                            }
                        ]
                    },
                    "unit": "decbytes"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 2,
                "x": 8,
                "y": 7
            },
            "id": 37,
            "interval": null,
            "links": [],
            "maxDataPoints": 100,
            "options": {
                "orientation": "horizontal",
                "reduceOptions": {
                    "calcs": [
                        "lastNotNull"
                    ],
                    "fields": "",
                    "values": false
                },
                "showThresholdLabels": false,
                "showThresholdMarkers": true,
                "text": {}
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "dsType": "influxdb",
                    "groupBy": [
                        {
                            "params": [
                                "$interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "win_mem",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ memory-free-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "Available_Bytes"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "mean"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        }
                    ]
                }
            ],
            "title": "Memory Free",
            "type": "gauge"
        },
        {
            "datasource": null,
            "description": "",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "fixed"
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
                    "unit": "short"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 2,
                "x": 10,
                "y": 7
            },
            "id": 39,
            "options": {
                "colorMode": "none",
                "graphMode": "none",
                "justifyMode": "auto",
                "orientation": "auto",
                "reduceOptions": {
                    "calcs": [],
                    "fields": "/.*/",
                    "values": false
                },
                "text": {},
                "textMode": "value"
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "query": "{{ performance-state-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Performance State",
            "type": "stat"
        },
        {
            "collapsed": false,
            "datasource": null,
            "gridPos": {
                "h": 1,
                "w": 24,
                "x": 0,
                "y": 13
            },
            "id": 24,
            "panels": [],
            "repeat": "GPU",
            "title": "Graphs",
            "type": "row"
        },
        {
            "datasource": null,
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
                        "fillOpacity": 100,
                        "gradientMode": "opacity",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "linear",
                        "lineStyle": {
                            "fill": "solid"
                        },
                        "lineWidth": 1,
                        "pointSize": 5,
                        "scaleDistribution": {
                            "type": "linear"
                        },
                        "showPoints": "never",
                        "spanNulls": true,
                        "stacking": {
                            "group": "A",
                            "mode": "none"
                        },
                        "thresholdsStyle": {
                            "mode": "off"
                        }
                    },
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
                    "unit": "percent"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 7,
                "w": 12,
                "x": 0,
                "y": 14
            },
            "id": 10,
            "links": [],
            "options": {
                "legend": {
                    "calcs": [],
                    "displayMode": "hidden",
                    "placement": "bottom"
                },
                "tooltip": {
                    "mode": "single"
                }
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "alias": "GPU Utilization for $GPU on $hostname",
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ gpu-utilization-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "utilization_gpu"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=~",
                            "value": "/^$GPU$/"
                        }
                    ]
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "GPU Utilization",
            "type": "timeseries"
        },
        {
            "datasource": null,
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
                        "fillOpacity": 100,
                        "gradientMode": "opacity",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "stepAfter",
                        "lineWidth": 1,
                        "pointSize": 5,
                        "scaleDistribution": {
                            "type": "linear"
                        },
                        "showPoints": "never",
                        "spanNulls": true,
                        "stacking": {
                            "group": "A",
                            "mode": "none"
                        },
                        "thresholdsStyle": {
                            "mode": "off"
                        }
                    },
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
                    "unit": "percent"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 7,
                "w": 12,
                "x": 12,
                "y": 14
            },
            "id": 8,
            "links": [],
            "options": {
                "legend": {
                    "calcs": [],
                    "displayMode": "hidden",
                    "placement": "bottom"
                },
                "tooltip": {
                    "mode": "single"
                }
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "alias": "Memory Utilization for $GPU on $hostname",
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ memory-utilization-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "utilization_memory"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=~",
                            "value": "/^$GPU$/"
                        }
                    ]
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Memory Utilization",
            "type": "timeseries"
        },
        {
            "datasource": null,
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
                    }
                },
                "overrides": []
            },
            "gridPos": {
                "h": 8,
                "w": 24,
                "x": 0,
                "y": 21
            },
            "id": 41,
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
            "targets": [
                {
                    "query": "{{ encoderdecoder-utilisation-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Encoder/Decoder Utilisation",
            "type": "timeseries"
        },
        {
            "datasource": null,
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
                        "fillOpacity": 10,
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
                        "showPoints": "never",
                        "spanNulls": true,
                        "stacking": {
                            "group": "A",
                            "mode": "none"
                        },
                        "thresholdsStyle": {
                            "mode": "off"
                        }
                    },
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
                    "unit": "percent"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 8,
                "w": 12,
                "x": 0,
                "y": 29
            },
            "id": 6,
            "links": [],
            "options": {
                "legend": {
                    "calcs": [],
                    "displayMode": "hidden",
                    "placement": "bottom"
                },
                "tooltip": {
                    "mode": "single"
                }
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "alias": "Fan Speed % for  $GPU on $hostname",
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ fan-speed--0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "fan_speed"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=~",
                            "value": "/^$GPU$/"
                        }
                    ]
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Fan Speed %",
            "type": "timeseries"
        },
        {
            "datasource": null,
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
                        "fillOpacity": 10,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "smooth",
                        "lineStyle": {
                            "fill": "solid"
                        },
                        "lineWidth": 1,
                        "pointSize": 5,
                        "scaleDistribution": {
                            "type": "linear"
                        },
                        "showPoints": "auto",
                        "spanNulls": true,
                        "stacking": {
                            "group": "A",
                            "mode": "none"
                        },
                        "thresholdsStyle": {
                            "mode": "off"
                        }
                    },
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
                    "unit": "celsius"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 8,
                "w": 12,
                "x": 12,
                "y": 29
            },
            "id": 16,
            "links": [],
            "options": {
                "legend": {
                    "calcs": [],
                    "displayMode": "hidden",
                    "placement": "bottom"
                },
                "tooltip": {
                    "mode": "single"
                }
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "alias": "GPU Temperature for  $GPU on $hostname",
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ gpu-temperature-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "temperature_gpu"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=~",
                            "value": "/^$GPU$/"
                        }
                    ]
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "GPU Temperature",
            "type": "timeseries"
        },
        {
            "datasource": null,
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
                        "fillOpacity": 10,
                        "gradientMode": "hue",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "smooth",
                        "lineWidth": 1,
                        "pointSize": 5,
                        "scaleDistribution": {
                            "type": "linear"
                        },
                        "showPoints": "never",
                        "spanNulls": true,
                        "stacking": {
                            "group": "A",
                            "mode": "none"
                        },
                        "thresholdsStyle": {
                            "mode": "off"
                        }
                    },
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
                    "unit": "short"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 9,
                "w": 12,
                "x": 0,
                "y": 37
            },
            "id": 20,
            "links": [],
            "options": {
                "legend": {
                    "calcs": [],
                    "displayMode": "hidden",
                    "placement": "bottom"
                },
                "tooltip": {
                    "mode": "single"
                }
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "alias": "PCI-GEN",
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ pci-generationwidth-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "pcie_link_gen_current"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=~",
                            "value": "/^$GPU$/"
                        }
                    ]
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "PCI Generation/Width",
            "type": "timeseries"
        },
        {
            "datasource": null,
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
                        "fillOpacity": 10,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "lineInterpolation": "stepAfter",
                        "lineWidth": 1,
                        "pointSize": 5,
                        "scaleDistribution": {
                            "type": "linear"
                        },
                        "showPoints": "never",
                        "spanNulls": true,
                        "stacking": {
                            "group": "A",
                            "mode": "none"
                        },
                        "thresholdsStyle": {
                            "mode": "off"
                        }
                    },
                    "mappings": [],
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            },
                            {
                                "color": "#EAB839",
                                "value": 200
                            },
                            {
                                "color": "red",
                                "value": 280
                            }
                        ]
                    },
                    "unit": "watt"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 9,
                "w": 12,
                "x": 12,
                "y": 37
            },
            "id": 12,
            "links": [],
            "options": {
                "legend": {
                    "calcs": [],
                    "displayMode": "hidden",
                    "placement": "bottom"
                },
                "tooltip": {
                    "mode": "single"
                }
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "alias": "Power Draw for $GPU on $hostname",
                    "groupBy": [
                        {
                            "params": [
                                "$__interval"
                            ],
                            "type": "time"
                        },
                        {
                            "params": [
                                "null"
                            ],
                            "type": "fill"
                        }
                    ],
                    "measurement": "nvidia_smi",
                    "orderByTime": "ASC",
                    "policy": "default",
                    "query": "{{ power-draw-0 }}",
                    "refId": "A",
                    "resultFormat": "time_series",
                    "select": [
                        [
                            {
                                "params": [
                                    "power_draw"
                                ],
                                "type": "field"
                            },
                            {
                                "params": [],
                                "type": "distinct"
                            }
                        ]
                    ],
                    "tags": [
                        {
                            "key": "host",
                            "operator": "=~",
                            "value": "/^$hostname$/"
                        },
                        {
                            "condition": "AND",
                            "key": "name",
                            "operator": "=~",
                            "value": "/^$GPU$/"
                        }
                    ]
                }
            ],
            "timeFrom": null,
            "timeShift": null,
            "title": "Power Draw",
            "type": "timeseries"
        }
    ],
    "refresh": "5s",
    "schemaVersion": 32,
    "style": "dark",
    "tags": [
        "nvidia"
    ],
    "templating": {
        "list": []
    },
    "time": {
        "from": "now-6h",
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
        ],
        "time_options": [
            "5m",
            "15m",
            "1h",
            "6h",
            "12h",
            "24h",
            "2d",
            "7d",
            "30d"
        ]
    },
    "timezone": "",
    "title": "NVIDIA",
    "uid": "yibDnpuWz",
    "version": 10
}