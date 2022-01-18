## speedtestw

This is a wrapper for the [speedtest.net](https://www.speedtest.net/apps/cli) binary written in golang.

Its purpose is to read the nearest servers from speedtest, then run them in series to prevent executions of
each test affecting the performance of others.

Output is in JSON format and can then be pulled into telegraf using the config at [telegraf/speedtest.conf](../telegraf/speedtest.conf)

> **Note**
>
> each test takes approximately 10 to 15 seconds on average. Depending on how many servers speedtest.net returns
> this may take between 3 and 5 minutes to complete.
>
> Make sure you set the timeout interval in speedtest.conf to a suitable value - current 5 minutes.
