## Auditbeat

### Installation

#### <b>Option 1.</b> Automated Installation.

### Windows:

1. As administrator, enter the following command in Powershell or download the zip file [here](https://github.com/themarcusaurelius/Auditbeat/archive/master.zip).

```
Start-BitsTransfer -Source 'https://github.com/themarcusaurelius/Auditbeat/archive/master.zip' -Destination 'C:\Users\Administrator\Downloads\Auditbeat.zip'
```

2. Unzip the package and extract the contents to the `C:/` drive.

3. Back in Powershell, CD into the extracted folder and run the following script:

```
.\installAuditbeat.ps1
```

4. When prompted, enter your credentials below and click OK.

```css
Kibana URL: _PLACEHOLDER_KIBANA_URL_
Username: _PLACEHOLDER_USERNAME_
Password: _PLACEHOLDER_PASSWORD_
Elasticsearch API Endpoint: _PLACEHOLDER_API_ENDPOINT_
```

5. Choose the folder you would like to monitor and click OK:

<p align="center">
    <img src="https://giant.gfycat.com/DelayedSandyHammerheadbird.gif">
</p>


This will install and run auditbeat.

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<hr>

### Linux:

1. Enter the following script into the console using elevated privileges

```Linux
curl https://olympus-io.github.io/vizion.ai/beat-install-scripts/install-config-auditbeat.sh > install-config-auditbeat.sh; chmod a+x  install-config-auditbeat.sh; ./install-config-auditbeat.sh _PLACEHOLDER_API_ENDPOINT_
```

2. When prompted, select the proper environment to complete the installation.

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<hr>

#### <b>Option 2.</b> Manual Installation.

### Windows:

1. [Download Auditbeat.](https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-oss-6.5.4-windows-x86_64.zip)

2. Extract the contents of the zip file into the ```C:\``` drive.

3.  Rename the ```auditbeat-6.5.4-windows``` directory in the C:\ drive to ```Auditbeat```.

4. Open a PowerShell prompt as administrator and cd into the ```C:\``` drive.

5. Set the execution policy to be able to run the execution script. CD into the Auditbeat folder and run the following script:

```
 PowerShell.exe -ExecutionPolicy UnRestricted -File .\install-service-auditbeat.ps1
```

6. Configure the ```auditbeat.yml``` file with the correct Vizion.ai credentials.

<i>Tip: The easiest way to do this is to open the file up in a code editor such as Visual Studio Code.</i>

<b>Kibana:</b>

```yaml
setup.kibana
  host: "_PLACEHOLDER_KIBANA_URL_"
  username: "_PLACEHOLDER_USERNAME_"
  password: "_PLACEHOLDER_PASSWORD_"
```

<b>Elasticsearch Output:</b>

```yaml
output.elasticsearch
  hosts: ["_PLACEHOLDER_API_ENDPOINT_"]
```

7. Test the ```auditbeat.yml``` configuration. In PowerShell, run the following script in the Auditbeat folder:

```
.\auditbeat.exe -e -configtest
```

8. Setup pre-configured Dashboards in Kibana.

```
.\auditbeat.exe setup --dashboards
```

9. Run the program in the foreground to make sure everything is setup:

```
 .\auditbeat.exe -c auditbeat.yml -e -d "*"
```

10. Once the config has been tested and runs without any ERROR messages, install ```Auditbeat``` as a service:

```
.\install-service-auditbeat.ps1
```

11. Test that ```Auditbeat``` has been installed as a service:

```
service auditbeat
```

12.  Start the ```Auditbeat``` service as a background process: 

```
start-service auditbeat
```

**Data should now be shipping to your Vizion Elastic app. Check the ```Discover``` tab in Kibana for the incoming logs**

<hr>
