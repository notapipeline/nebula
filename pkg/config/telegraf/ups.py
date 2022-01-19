import json
from nut2 import PyNUTClient

remove_keys = ['battery.type', 'device.serial', 'ups.realpower.nominal',
               'ups.vendorid', 'ups.serial', 'ups.productid', 'ups.model',
               'ups.mfr', 'driver.version.data', 'driver.version',
               'device.type', 'device.mfr', 'driver.version.internal',
               'driver.version.usb', 'ups.beeper.status', 'driver.name',
               'battery.mfr.date', 'ups.firmware', 'ups.firmware.aux',
               'ups.mfr.date', 'battery.date', 'battery.charge.low',
               'battery.charge.warning', 'battery.runtime.low',
               'driver.parameter.pollfreq', 'driver.parameter.pollinterval',
               'driver.parameter.port', 'input.sensitivity',
               'input.transfer.high', 'input.transfer.low',
               'ups.delay.shutdown', 'ups.test.result', 'ups.timer.reboot',
               'ups.timer.shutdown', 'driver.parameter.synchronous']


def lines_that_start_with(string, fp):
    return [line for line in fp if line.startswith(string)]


def convert_to_type(s):
    try:
        int_var = int(s)
        return int_var
    except ValueError:
        try:
            float_var = float(s)
            return float_var
        except ValueError:
            return s


def construct_object(data, remove_keys, host):
    result = {
        'measurement': 'ups',
        'source': 'nut'
    }

    for k, v in data.items():
        if k == "ups.serial":
            if v:
                result["hardware"] = ':'.join(v[i:i+2] for i in range(0, 12, 2)).strip(":")
        elif k == "device.model":
            w = v.split("FW:", 2)
            if v == "InternalBattery-0":
                result["model"] = "InternalBattery"
            else:
                result["model"] = w[0].strip()
        else:
            if k in remove_keys:
                continue
            else:
                result[k] = convert_to_type(v)

    return result


with open("/etc/nut/upsmon.conf", "r") as fp:
    for line in lines_that_start_with("MONITOR", fp):
        _, host, _, username, password, typestr = line.split(' ')
        device, host = host.split('@')
        ups_client = PyNUTClient(host=host, port=3493, login=username,
                                 password=password, debug=False)
        ups_data = ups_client.list_vars(device)

        json_body = construct_object(ups_data, remove_keys, host)
        print(json.dumps(json_body, indent=4))
