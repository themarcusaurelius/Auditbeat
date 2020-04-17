## A Lightweight Shipper For Audit Data.

Install on your servers to audit the activities of users and processes on your systems. For example, you can use Auditbeat to collect and centralize audit events from the Linux Audit Framework. You can also use Auditbeat to detect changes to critical files, like binaries and configuration files, and identify potential security policy violations.

### Default folders monitored:

##### Windows: 

```
  - C:/windows
  - C:/windows/system32
  - C:/Program Files
  - C:/Program Files (x86)
```

##### Linux:

```
  - /bin
  - /usr/bin
  - /sbin
  - /usr/sbin
  - /etc
```


## Installation

### Windows:

1) As administrator, enter the following command in Powershell or download the zip file [here](https://github.com/themarcusaurelius/Auditbeat/archive/master.zip).

```
Start-BitsTransfer -Source 'https://github.com/themarcusaurelius/Auditbeat/archive/master.zip' -Destination 'C:\Users\Administrator\Downloads\Auditbeat.zip'
```

2) Unzip the package and extract the contents to the `C:/` drive.

3) Back in Powershell, CD into the extracted folder and run the following script:

```
.\installAuditbeat.ps1
```

4) When prompted, enter your credentials below and click OK.

```css
Kibana URL: _PLACEHOLDER_KIBANA_URL_
Username: _PLACEHOLDER_USERNAME_
Password: _PLACEHOLDER_PASSWORD_
Elasticsearch API Endpoint: _PLACEHOLDER_API_ENDPOINT_
```

This will install and run auditbeat.

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<hr>

### Linux:

1) Enter the following script into the console using elevated privileges

```Linux
curl https://olympus-io.github.io/vizion.ai/beat-install-scripts/install-config-auditbeat.sh > install-config-auditbeat.sh; chmod a+x  install-config-auditbeat.sh; ./install-config-auditbeat.sh _PLACEHOLDER_API_ENDPOINT_
```

2) When prompted, select the proper environment to complete the installation.

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<hr>

## Example Dashboard

The dashboards are provided as examples. We recommend that you customize them to meet your needs.

![Imgur](https://imgur.com/WJrEPuq.jpg)



