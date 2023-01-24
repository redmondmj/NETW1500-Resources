# NETW1500 Lab 2 - Tools

Created: January 18, 2023 10:01 PM
Last Updated: January 24, 2023 11:24 AM
Status: Not started
URL: https://redmondo.notion.site/NETW1500-Lab-2-Tools-f1ef39e2083a4844afeb2f3fca77bc18

## Hands-On Activity

Complete these activities in your Name-DC01 server on our [ESXi Server](https://172.16.144.100/ui/#/login). There is no need to screenshot/document. Although, it is recommended that you keep your own notes for future reference.

<aside>
🚧 In some cases you may need to substitute your own IP address or Hostname. The lab doc may refer to the hostname as SERVERX, yours should be NAME-DC01

</aside>

### 2-1 Server Manager

In this Hands-On activity, you explore the different configuration and management features of Server Manager.

1. Boot your Windows Server 2019 host and log into the system as Administrator using the password **Secret555**. After a few moments, Server Manager will open. If prompted to try the Windows Admin Center, select **Don’t show this message again** and close the information window.
2. Within the Server Manager Dashboard, observe the roles and server groups shown. Note that your server is represented by Local Server, a member of the All Servers group and has the File and Storage Services role installed. Also note whether there are any services that are flagged red. If this is the case, click **Services** under your Local Server and note the services that are not started and the reason why.

<aside>
💡 Many services within Windows Server 2019 are set to Delayed Start, so that they start several minutes following a Windows Server 2019 boot. If you see red flagged services that are listed as Delayed Start, click the Refresh icon in the upper corner of the Server Manager console after a few minutes, and the red flags should disappear.

</aside>

1. Highlight **Local Server** in the navigation pane of Server Manager.
    1. Observe the default events shown in the Events pane. Next, click **Tasks, Configure Event Data** within the Events pane. At the Configure Event Data window, select **Informational** and click **OK**. Note the additional events that are now shown within the Events pane.
    2. In the Performance pane, click **Tasks, Configure Performance Alerts**. Note the default alert thresholds and graph display period and click **Cancel**.
    3. In the Roles and Features pane, click **Tasks, Add Roles and Features**.
        1. At the Before you begin page, select the **Skip this page by default** checkbox, and click **Next**.
        2. At the Select installation type `page`, click **Next**.
        3. At the Select destination server page, click **Next**.
        4. At the Select server roles page, select **DHCP Server**, and click **Add Features** when prompted. If prompted to continue after validation errors (because your system has a DHCP-assigned IP address), click **Continue**. Click **Next** when finished.
        5. At the Select features page, select **Telnet Client** and click **Next**.
        6. At the DHCP Server page, read the information regarding best practices and click **Next**.
        7. Click **Install** to install the DHCP Server role and Telnet Client feature.
        8. After the installation has completed, click **Complete DHCP configuration**, click **Commit**, and then click **Close**.
        9. Click **Close** to close the Add Roles and Features Wizard.
2. Highlight **DHCP** in the navigation pane of Server Manager.
    1. In the Best Practices Analyzer pane, click **Tasks, Start BPA Scan**, and then click **Start Scan**. Note the Warning and Error that you receive.
    2. In the Services pane, right-click the **DHCP Server** service and click **Stop Services**.
3. Click **Dashboard** in the navigation pane of Server Manager. Note that there is one service and one BPA result red flagged for the DHCP, Local Server and All Servers groups.
    1. Click **Services** under Local Server and note that the DHCP Server service is stopped. Right click the **DHCP Server** service, click **Start Services,** and then click **OK**. Click the **Refresh** button in the upper right of Server Manager and note that the service-related red flag disappears.
    2. Click **BPA results** under Local Server and note the Predeployment error shown. Right click the error, click **Exclude Result,** and then click **OK**. Click the **Refresh** button in the upper right of Server Manager and note that the BPA-related red flag disappears.
4. In the upper right of Server Manager, click **Manage**, **Add Servers**. Note that you can add servers within your Active Directory domain, by DNS name, or import them from a file. Because your computer is not domain-joined, you do not see entries under the Active Directory tab. Click **Cancel**.
5. In the upper right of Server Manager, click **Manage**, **Create Server Group**. In the Create Server Group window, specify a name of **Building1** in the Server group name box. Next, highlight **SERVER*X*** in the Server Pool tab, click the arrow button to move it to the Selected pane, and click **OK**. Note that your new server group appears within the navigation pane.
6. Highlight **Building1** in the navigation pane of Server Manager. Right-click **SERVER*X*** in the Servers pane and note the options available on the menu. Select the **Windows PowerShell** option to open a Windows PowerShell console as Administrator. Close the Windows PowerShell console when finished.
7. In the upper right of Server Manager, click **Tools** and note the tools that are available. Next, click **Manage, Server Manager Properties**. In the Server Manager Properties window, select **Do not start Server Manager automatically at logon** and click **OK**.
8. Close the Server Manager window.

### 2-2 Windows Admin Center

In this Hands-On activity, you install and explore the different configuration and management features of the Windows Admin Center. As discussed in class, Windows Admin Center is updated regularly so if the instructions don’t match you may need to look for the equivalent.

1. On your Windows Server 2019 host, open the Google Chrome Web browser and navigate to [https://aka.ms/WindowsAdminCenter](https://aka.ms/WindowsAdminCenter). Follow the prompts to download the latest non-preview version of the Windows Admin Center. When finished, the downloaded file will automatically be opened to start the installation.
    1. At the Use Microsoft Update page, click **Next**.
    2. At the Windows Admin Center Setup screen, select **I accept the terms in the License Agreement** and click **Next**.
    3. At the Install Windows Admin Center on Windows Server page, click **Next**.
    4. At the Installing Windows Admin Center page, click **Next**. Note that the installation program will generate a self-signed encryption certificate for use on port 443 (HTTPS) and click **Install**.
    5. Click **Finish**.
2. Navigate to https://SERVER*X*:443 (remember SERVERX should be replaced with your hostname i.e. https://MATT-DC01:443 , you may also replace this with the generic localhost) within the Chrome Web browser and click **Skip tour** when prompted. Maximize your Chrome Web browser screen.
3. At the All connections page, click **Add, Servers**. Note that you can add servers by server name or import a list of server names. Click **Cancel**.
4. Highlight **server*x*** within the All connections page and click **Edit tags**. At the Edit connection tags window, type **2019HOST** and click **Save**.
5. Highlight **server*x*** within the All Connections page and click **Connect**. Within the Overview tool, view the information shown and then click **Manage alerts**.
    1. Select **Environment variables** and note that you can create and edit system and user environment variables.
    2. Select **Power configuration**, select the **High performance** power plan and click **Save**.
6. Highlight **Devices** within the Tools pane. Note that you can disable existing hardware devices or update their device drivers.
7. Highlight **Network** within the Tools pane. Select your Ethernet adapter and click **Actions, Settings**. Note that you can configure IPv4 and IPv6 settings for your Ethernet adapter.
8. Highlight **PowerShell** within the Tools pane to open a Windows PowerShell prompt. Type **`exit**` and press **Enter** to stop your Windows PowerShell session.
9. Highlight **Registry** within the Tools pane. Expand **HKEY_CLASSES_ROOT** and highlight **.ac3**. Note that you can add, modify, and delete values.
10. Highlight **Roles & Features** within the Tools pane. Select **DHCP Server** and click **Remove**. Click **Yes** to remove the role.
11. Optionally navigate to the other tools within the Windows Admin Center and note their functionality. Close Google Chrome when finished.

### 2-3 Configuration Utilities

In this Hands-On activity, you explore various Windows configuration utilities available within Windows Server 2019.

1. On your Windows Server 2019 host, click **Start** and then click **Control Panel**.
2. Navigate to **System and Security**, **System**, **Advanced system settings**. Under the Performance section of the System Properties window, click **Settings**.
    1. Next, highlight the **Advanced** tab and note the default setting for Processor scheduling.
    2. Click **Change** and note the default size of the paging file that is currently allocated on your system. Because the paging file size is managed by the system by default, this value should be close to the recommended value shown.
    3. Click **OK** to close the Virtual Memory window.
    4. Highlight the **Data Execution Prevention** tab and note the default settings that apply DEP to all programs and services.
    5. Click **OK** to close the Performance Options window.
3. Under the Startup and Recovery section of the System Properties window, click **Settings**. Note the default options and location of the dump file. Click **OK** to close the Startup and Recovery window when finished.
4. At the bottom of the System Properties window, click **Environment Variables**.
    1. In the User variables for Administrator section, click **New**.
    2. At the New User Variable window, supply a Variable name of VAR1 and Variable value of Sample Variable and click **OK**.
    3. In the System variables section, note the values of the Path, TEMP, TMP, and windir variables and click **OK**.
5. In the System Properties window, highlight the **Hardware** tab and click **Device Manager**.
    1. Devices that require attention will be marked with a yellow label and shown by default. If you see any Unknown devices, right-click the device, choose **Update driver** and follow the prompts to search for a driver on the Internet or from removable media supplied by your manufacturer.
    2. Expand **Disk drives**, right-click your storage device, and click **Properties**. Highlight the **Policies** tab and note that write caching is enabled on the device by default but that flushing is not. Click **OK** to close the properties window.
    3. Close Device Manager and click **OK** to close the System Properties window. If you are prompted to restart your computer to apply changes, click **Restart Later**.
6. In the Control Panel window, click **Control Panel** in the navigation bar to switch back to the Category view. Next, click **Add a device** under the Hardware category. Your system will search for devices that may not have been detected by PnP. Follow any prompts to install devices that are found. If no devices were found, click **Cancel**. Close Control Panel when finished.
7. Navigate to **System and Security**, **Power Options**.
    1. Select the **High performance** power plan.
    2. Click **Change plan settings** and note the defaults.
    3. Click **Change advanced power settings**. Navigate through the detailed power plan settings that are available for your computer, making changes that you desire as necessary. Click **OK** when finished.
    4. If you made changes to your power plan, click **Save changes**, otherwise, click **Cancel**.
    5. Close Control Panel.
8. Right-click the Start menu and click **Run**. Type `regedit` in the Run dialog box and click **OK**. Expand **HKEY_CLASSES_ROOT** and highlight **.ac3**. Note that you can add, modify, and delete values. Double-click **(Default)**, supply the value audio, and click **OK**. Close the Registry Editor when finished.
9. Right-click the Start menu and click **Run**. Type `sigverif` in the Run dialog box and click **OK**. In the File Signature Verification tool, click **Start** to scan your system for unsigned files. When the scan has completed, click **OK** and then click **Close** to close the File Signature Verification tool.
10. Right-click the Start menu and click **Run**. Type `cmd` in the Run dialog box and click **OK**. At the command prompt, type `sfc /scannow` and press **Enter**. Note whether any system files were replaced with correct versions and close the command prompt window when finished.

### 2-4 Cmdlets

In this Hands-On activity, you work with common Windows PowerShell administrative cmdlets.

1. On your Windows Server 2019 host, open the Google Chrome Web browser. Next, right-click the **Start** menu and choose **Windows PowerShell (Admin)** to open Windows PowerShell.
2. At the prompt, type `Get-Process | more` and press **Enter**. Note that there are many processes with a ProcessName of chrome that comprise the Google Chrome Web browser. Press `q` to quit the more command. Next, type `Stop-Process -name chrome` and press **Enter**. Note that the Google Chrome Web browser app was closed.
3. At the prompt, type `Get-Service | ogv` and press **Enter**. Note that the App Readiness service is called AppReadiness and is not started by default. Close the GridView window. Next, type `Start-Service -name AppReadiness` and press **Enter** to start the service. Next, type `Stop-Service -name AppReadiness` and press **Enter** to stop the App Readiness service.
4. At the prompt, type `Get-WindowsFeature | ogv` and press **Enter** to view installed roles and features. Note that the Telnet Client feature that you installed earlier in Hands-On activity 2-1 is given the name Telnet-Client. Close the Out-GridView window. Next, type `Remove-WindowsFeature -name Telnet-Client` and press **Enter** to remove the feature.
5. At the prompt, type `Test-NetConnection` and press **Enter** to test your network connectivity to internetbeacon.msedge.net. Next, execute the following commands at the command prompt, in turn. For each one, note the network configuration information displayed.

![1.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/1.png)

- Details
1. Close Windows PowerShell.

### 2-5 Cmdlet Output

In this Hands-On activity, you modify the output of Windows PowerShell cmdlets.

1. Right-click the **Start** menu and choose **Windows PowerShell (Admin)** to open Windows PowerShell.
2. At the prompt, type `cd \` and press **Enter** to switch to the root directory. Next, type `dir` and press **Enter** to list the contents of this directory.
3. At the prompt, type `alias dir` and press **Enter**. Next, type `alias gci` and press **Enter**. Note that dir and gci are aliases to the Get-ChildItem cmdlet. Execute the following commands at the command prompt, in turn. For each one, interpret the output (referencing the aliases and cmdlets within this module, as necessary).

![2.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/2.png)

- Details
1. Other cmdlets that generate a large amount of information may require that you use additional Windows PowerShell features to modify command output for organization and readability. Execute the following commands at the command prompt, in turn. For each one, interpret the output (referencing the aliases and cmdlets within this module, as necessary).

![3.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/3.png)

- Details

(Close the GridView window when finished.)

![4.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/4.png)

- Details

(Close the GridView window when finished.)

![5.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/5.png)

- Details

(Close the GridView window when finished.)

![6.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/6.png)

- Details

(Choose to open in Google Chrome, and close Chrome when finished.)

![7.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/7.png)

- Details

(Choose to open in WordPad and close WordPad when finished.)

1. Close Windows PowerShell.

### 2-6 PowerShell Providers

In this Hands-On activity, you work with PowerShell providers.

1. Right-click the **Start** menu and choose **Windows PowerShell (Admin)** to open Windows PowerShell.
2. At the prompt, type `Get-PSProvider` and press **Enter** to view the available PowerShell providers. Next, type `Get-PSDrive` and press **Enter** to view the expanded list of PowerShell providers. Note that the filesystem provider is available for each drive letter on the system, and that registry provider is available for HKEY_CURRENT_USER and HKEY_LOCAL_MACHINE.
3. Each PowerShell provider treats each item that it works with as an object. At the prompt, type `gci | Get-Member` and press **Enter** to view the properties available for the objects within the current directory of the filesystem provider. Note that there is a PSIscontainer property that indicates that the object is a subdirectory. Next, type `gci | Where-Object {$_.psiscontainer}` and press **Enter** to view only directories. Following this, type `gci | Where-Object {!$_.psiscontainer}` and press **Enter** to view only non-directories (i.e., files).
4. Within the filesystem provider, you can create, edit, and remove objects, such as files and directories. Execute the following commands at the command prompt, in turn. For each one, interpret the output (referencing the aliases and cmdlets within this module, as necessary).

![8.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/8.png)

- Details
1. At the prompt, type `sl env:\` and press **Enter** to switch to the environment provider. Next, type `gci` and press **Enter** to view the environment variables on the system. In many PowerShell providers, you can instead use the Get-Item cmdlet (alias gi) to view items. Type `gi *` and press **Enter** to view all items within the environment provider. Next, execute the following commands at the command prompt, in turn. For each one, interpret the output (referencing the aliases and cmdlets within this module, as necessary).

![9.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/9.png)

- Details
1. At the prompt, type sl variable:\ and press **Enter** to switch to the variable provider. Next, type `gci` and press **Enter** to view the user-defined PowerShell variables on the system. Next, execute the following commands at the command prompt, in turn. For each one, interpret the output (referencing the aliases and cmdlets within this module, as necessary).

![10.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/10.png)

- Details
1. At the prompt, type `sl alias:\` and press **Enter** to switch to the alias provider. Next, type `gci` and press **Enter** to view the user-defined PowerShell variables on the system. Following this, type `gci | Where-Object {$_.name –like "c*"}` and press **Enter** to view aliases that start with c. Note that “clear” is an alias to Clear-Host.
2. You can also view aliases by their definition. At the prompt, type `gci | Where-Object {$_.definition –like "c*"}` to view aliases that point to cmdlets that start with the letter c.
3. At the prompt, type `sl function:\` and press **Enter** to switch to the function provider. Next, type `gci` and press **Enter** to view the functions on the system. Note that Clear-Host is a function. Next, type `Get-Content Clear-Host` and press **Enter** to view the content of the Clear-Host function.
4. At the prompt, type `sl cert:\` and press **Enter** to switch to the certificate provider. Next, type `gci` and press **Enter**. Note that the certificate provider can manage certificates for the current user and local computer. Next, type `gci -recurse` and press **Enter**. Note the self-signed certificate installed on your system by the Windows Admin Center is displayed in the list.
5. At the prompt, type `sl 'HKLM:\software\microsoft\windows nt\currentversion'` and press **Enter** to switch to the registry provider for HKEY_LOCAL_MACHINE and navigate to the currentversion subkey for your Windows server system. Next, type `set-itemproperty –path winlogon –name legalnoticecaption –value "Hey!"` and press **Enter** to set a legal notice caption for local logon attempts. Finally, type `set-itemproperty –path winlogon –name legalnoticetext –value "What are you doing on my system?"` and press **Enter** to modify the text message for local logon attempts.
6. Right-click the **Start** menu and click **Shut down or sign out**, **Sign out**. Press Ctrl+Alt+Del (or Ctrl+Alt+End if you are running Windows Server 2019 within a Hyper-V virtual machine on Windows 10). Note your legal notice and click **OK**. Log into the system as Administrator using the password **Secret555**.

### 2-7 WMI

In this Hands-On activity, you query WMI using Windows PowerShell.

1. Right-click the **Start** menu and choose **Windows PowerShell (Admin)** to open Windows PowerShell.
2. At the prompt, type `alias gwmi` and press **Enter**. Note that gwmi is an alias to Get-WmiObject. Next, execute the following commands at the command prompt, in turn. For each one, interpret the output (referencing the aliases and cmdlets within this module, as necessary).

![11.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/11.png)

- Details
1. You can also query WMI using WQL syntax. Execute the following commands at the command prompt, in turn. For each one, interpret the output (referencing the aliases and cmdlets within this module, as necessary).

![12.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/12.png)

- Details
    
    Watch for “wrapped lines” i.e. name=’c$’” should not really be on a line of it’s own… it it obviously meant to be the the “where” condition on line 4. It’s just wrapped to the next line for visibility.
    
1. Close Notepad and Windows PowerShell.

### 2-8 PowerShell Customization

In this Hands-On activity, you enable script execution and create a PowerShell profile script that loads a custom alias and function. Next, you create a PowerShell console file to customize your Windows PowerShell experience.

1. Right-click the **Start** menu and choose **Windows PowerShell (Admin)** to open Windows PowerShell.
2. At the prompt, type `Set-ExecutionPolicy` unrestricted and press **Enter**. Type Y when prompted to confirm. Next, type `Test-Path $profile` and press **Enter**. Note that you do not have a PowerShell profile script configured.
3. At the prompt, type `New-Item –path $profile –itemtype file -force` and press **Enter** to create a PowerShell profile. Next, type `notepad $profile` to open your PowerShell profile script within Notepad. Add the following lines:

![13.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/13.png)

- Details
1. Click **File, Save** within Notepad to save your changes. Close Notepad when finished.
2. At the prompt, type `cd Desktop` and press **Enter** to switch to your Desktop directory. Next, type `export-console CustomPS` and press **Enter** to create a CustomPS.psc1 file on your Desktop that can be used to open Windows PowerShell. Close Windows PowerShell when finished.
3. Double-click the **CustomPS** file on your desktop to open Windows PowerShell. Note that your PowerShell profile script executed and printed Hello to the screen. Type `lala` and press **Enter** to test your alias. Next, type `pro` and press **Enter** to test your function. Close Notepad when finished.
4. Click the PowerShell icon in the upper left of the Windows PowerShell window and click **Properties**. Navigate through the properties and make some visual changes to your liking (color, font, and so on). Click **OK** to close the Properties dialog box and close Windows PowerShell when finished.
5. Double-click the **CustomPS** file on your desktop to open Windows PowerShell. Note that your customizations are available. Close Windows PowerShell when finished.
6. Right-click the Start menu and choose **Windows PowerShell (Admin)** to open Windows PowerShell. Note that your customizations are not available as PowerShell was not started via the CustomPS.psc1 file.
7. Close Windows PowerShell.

### 2-9 PowerShell Scripting

In this Hands-On activity, you create and execute a basic PowerShell script using Windows PowerShell ISE, and execute it on the system.

1. Click **Start**. Next, right-click **Windows PowerShell ISE** and click **More, Run as administrator**.
2. Click the **New Script** button above the Windows PowerShell pane, and enter the following contents:

![14.png](NETW1500%20Lab%202%20-%20Tools%20f1ef39e2083a4844afeb2f3fca77bc18/14.png)

- Details
    
    Watch for “wrapped lines” i.e.HandleCount,VirtualizeSize….. should not really be on a line of it’s own… it it obviously meant to be the the Format-Table cmdlet on line 7. It’s just wrapped to the next line for visibility.
    
1. Click the **Run Script** button (or press **F5**) to test your script in the Windows PowerShell console. Type the value `svchost.exe` and press **Enter** when prompted.

<aside>
🔥 If there are errors in your script, fix the typos in your script and repeat Step 3.

</aside>

1. After your script executes properly, click **File, Save As**. Type `C:\myscript.ps1` in the File name box and click **Save**.
2. Close Windows PowerShell ISE.
3. Right-click the **Start** menu and choose **Windows PowerShell (Admin)** to open Windows PowerShell.
4. At the prompt, type `cd \` and press **Enter** to switch to the root of C:\. Next, type `./myscript.ps1` and press **Enter** to execute your script again. Type the value `svchost.exe` and press **Enter** when prompted.
5. Close Windows PowerShell.