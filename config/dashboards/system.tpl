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
    "editable": true,
    "fiscalYearStartMonth": 0,
    "gnetId": null,
    "graphTooltip": 0,
    "id": 6,
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
            "id": 2,
            "panels": [],
            "title": "System Overview",
            "type": "row"
        },
        {
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "decimals": 0,
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
                    "unit": "s"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 5,
                "x": 0,
                "y": 1
            },
            "id": 12,
            "options": {
                "colorMode": "value",
                "graphMode": "none",
                "justifyMode": "auto",
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
                    "query": "{{ uptime-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Uptime",
            "type": "stat"
        },
        {
            "datasource": null,
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
                "h": 6,
                "w": 3,
                "x": 5,
                "y": 1
            },
            "id": 4,
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "auto",
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
                    "query": "{{ cpus-0 }}",
                    "refId": "A"
                }
            ],
            "title": "CPUs",
            "type": "stat"
        },
        {
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 100,
                    "min": 0,
                    "thresholds": {
                        "mode": "percentage",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            },
                            {
                                "color": "#EAB839",
                                "value": 50
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
                "h": 6,
                "w": 5,
                "x": 8,
                "y": 1
            },
            "id": 14,
            "options": {
                "orientation": "auto",
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
                    "query": "{{ cpu-usage-0 }}",
                    "refId": "A"
                }
            ],
            "title": "CPU Usage",
            "type": "gauge"
        },
        {
            "datasource": null,
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
                "h": 6,
                "w": 3,
                "x": 13,
                "y": 1
            },
            "id": 6,
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "auto",
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
                    "query": "{{ memory-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Memory",
            "type": "stat"
        },
        {
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 100,
                    "min": 0,
                    "thresholds": {
                        "mode": "percentage",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            },
                            {
                                "color": "orange",
                                "value": 60
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
                "h": 6,
                "w": 5,
                "x": 16,
                "y": 1
            },
            "id": 16,
            "options": {
                "orientation": "auto",
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
                    "query": "{{ memory-used-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Memory Used",
            "type": "gauge"
        },
        {
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 5408287252480,
                    "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                                "color": "red",
                                "value": null
                            },
                            {
                                "color": "orange",
                                "value": 30
                            },
                            {
                                "color": "green",
                                "value": 90
                            }
                        ]
                    },
                    "unit": "decbytes"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 6,
                "w": 3,
                "x": 21,
                "y": 1
            },
            "id": 8,
            "options": {
                "colorMode": "value",
                "graphMode": "area",
                "justifyMode": "auto",
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
                    "query": "{{ free-space-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Free Space",
            "type": "stat"
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
                "h": 9,
                "w": 12,
                "x": 0,
                "y": 7
            },
            "id": 18,
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
                    "query": "{{ cpu-usage-total-0 }}",
                    "refId": "A"
                }
            ],
            "title": "CPU Usage Total",
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
                    },
                    "unit": "decbytes"
                },
                "overrides": []
            },
            "gridPos": {
                "h": 9,
                "w": 12,
                "x": 12,
                "y": 7
            },
            "id": 20,
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
                    "query": "{{ memory-usage-total-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Memory Usage Total",
            "type": "timeseries"
        },
        {
            "datasource": null,
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "custom": {
                        "align": "auto",
                        "displayMode": "auto"
                    },
                    "mappings": [],
                    "thresholds": {
                        "mode": "percentage",
                        "steps": [
                            {
                                "color": "green",
                                "value": null
                            },
                            {
                                "color": "orange",
                                "value": 80
                            },
                            {
                                "color": "red",
                                "value": 90
                            }
                        ]
                    },
                    "unit": "percent"
                },
                "overrides": [
                    {
                        "matcher": {
                            "id": "byName",
                            "options": "used"
                        },
                        "properties": [
                            {
                                "id": "custom.displayMode",
                                "value": "gradient-gauge"
                            },
                            {
                                "id": "min",
                                "value": 0
                            },
                            {
                                "id": "max",
                                "value": 100
                            }
                        ]
                    }
                ]
            },
            "gridPos": {
                "h": 9,
                "w": 12,
                "x": 0,
                "y": 16
            },
            "id": 10,
            "options": {
                "showHeader": true,
                "sortBy": []
            },
            "pluginVersion": "8.2.5",
            "targets": [
                {
                    "query": "{{ disk-utilisation-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Disk Utilisation",
            "type": "table"
        },
        {
            "datasource": null,
            "description": "Temperature Control",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 100,
                    "min": 0,
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
                "h": 4,
                "w": 2,
                "x": 12,
                "y": 16
            },
            "id": 24,
            "options": {
                "orientation": "auto",
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
                    "query": "{{ tctl-0 }}",
                    "refId": "A"
                }
            ],
            "title": "TCTL",
            "type": "gauge"
        },
        {
            "datasource": null,
            "description": "Temperatureof the DIE",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 100,
                    "min": 0,
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
                "h": 4,
                "w": 2,
                "x": 14,
                "y": 16
            },
            "id": 30,
            "options": {
                "orientation": "auto",
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
                    "query": "{{ tdie-0 }}",
                    "refId": "A"
                }
            ],
            "title": "TDIE",
            "type": "gauge"
        },
        {
            "datasource": null,
            "description": "Core Complex Die 1",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 100,
                    "min": 0,
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
                "h": 4,
                "w": 2,
                "x": 16,
                "y": 16
            },
            "id": 26,
            "options": {
                "orientation": "auto",
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
                    "query": "{{ tccd1-0 }}",
                    "refId": "A"
                }
            ],
            "title": "TCCD1",
            "type": "gauge"
        },
        {
            "datasource": null,
            "description": "Core Complex Die 2",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 100,
                    "min": 0,
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
                "h": 4,
                "w": 2,
                "x": 18,
                "y": 16
            },
            "id": 27,
            "options": {
                "orientation": "auto",
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
                    "query": "{{ tccd2-0 }}",
                    "refId": "A"
                }
            ],
            "title": "TCCD2",
            "type": "gauge"
        },
        {
            "datasource": null,
            "description": "Wireless temperature",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 100,
                    "min": 0,
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
                "h": 4,
                "w": 2,
                "x": 20,
                "y": 16
            },
            "id": 28,
            "options": {
                "orientation": "auto",
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
                    "query": "{{ wireless-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Wireless",
            "type": "gauge"
        },
        {
            "datasource": null,
            "description": "Wireless temperature",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "thresholds"
                    },
                    "mappings": [],
                    "max": 100,
                    "min": 0,
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
                "h": 4,
                "w": 2,
                "x": 22,
                "y": 16
            },
            "id": 29,
            "options": {
                "orientation": "auto",
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
                    "query": "{{ nvme-0 }}",
                    "refId": "A"
                }
            ],
            "title": "NVME",
            "type": "gauge"
        },
        {
            "datasource": null,
            "description": "Temperature of the DIE",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "continuous-BlYlRd"
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
                "h": 5,
                "w": 2,
                "x": 12,
                "y": 20
            },
            "id": 25,
            "options": {
                "colorMode": "value",
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
                    "query": "{{ running-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Running",
            "type": "stat"
        },
        {
            "datasource": null,
            "description": "Temperature of the DIE",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "continuous-BlYlRd"
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
                "h": 5,
                "w": 2,
                "x": 14,
                "y": 20
            },
            "id": 31,
            "options": {
                "colorMode": "value",
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
                    "query": "{{ sleeping-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Sleeping",
            "type": "stat"
        },
        {
            "datasource": null,
            "description": "Idle processes",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "continuous-BlYlRd"
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
                "h": 5,
                "w": 2,
                "x": 16,
                "y": 20
            },
            "id": 32,
            "options": {
                "colorMode": "value",
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
                    "query": "{{ idle-0 }}",
                    "refId": "A"
                }
            ],
            "title": "IDLE",
            "type": "stat"
        },
        {
            "datasource": null,
            "description": "Idle processes",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "continuous-BlYlRd"
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
                "h": 5,
                "w": 2,
                "x": 18,
                "y": 20
            },
            "id": 35,
            "options": {
                "colorMode": "value",
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
                    "query": "{{ stopped-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Stopped",
            "type": "stat"
        },
        {
            "datasource": null,
            "description": "Idle processes",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "continuous-BlYlRd"
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
                "h": 5,
                "w": 2,
                "x": 20,
                "y": 20
            },
            "id": 33,
            "options": {
                "colorMode": "value",
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
                    "query": "{{ dead-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Dead",
            "type": "stat"
        },
        {
            "datasource": null,
            "description": "Idle processes",
            "fieldConfig": {
                "defaults": {
                    "color": {
                        "mode": "continuous-BlYlRd"
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
                "h": 5,
                "w": 2,
                "x": 22,
                "y": 20
            },
            "id": 34,
            "options": {
                "colorMode": "value",
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
                    "query": "{{ zombies-0 }}",
                    "refId": "A"
                }
            ],
            "title": "Zombies",
            "type": "stat"
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
        "from": "now-6h",
        "to": "now"
    },
    "timepicker": {},
    "timezone": "",
    "title": "System",
    "uid": "jWctyF2nk",
    "version": 7
}