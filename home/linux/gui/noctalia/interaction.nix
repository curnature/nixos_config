{ ... }:
{
    programs.noctalia-shell.settings = {
        appLauncher = {
            enableClipboardHistory = false;
            autoPasteClipboard = false;
            enableClipPreview = true;
            clipboardWrapText = true;
            clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
            clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
            position = "center";
            pinnedApps = [ ];
            useApp2Unit = false;
            sortByMostUsed = true;
            terminalCommand = "kitty";
            customLaunchPrefixEnabled = false;
            customLaunchPrefix = "";
            viewMode = "list";
            showCategories = true;
            iconMode = "tabler";
            showIconBackground = false;
            enableSettingsSearch = true;
            enableWindowsSearch = true;
            ignoreMouseInput = false;
            screenshotAnnotationTool = ""; 
        };

        dock = {
            enabled = true;
            position = "bottom";
            displayMode = "auto_hide";
            backgroundOpacity = 1;
            floatingRatio = 1;
            size = 1;
            onlySameOutput = true;
            monitors = [ ];
            pinnedApps = [ ];
            colorizeIcons = false;
            pinnedStatic = false;
            inactiveIndicators = false;
            deadOpacity = 0.6;
            animationSpeed = 1; 
        };

        controlCenter = {
            position = "close_to_bar_button";
            diskPath = "/";
            shortcuts = {
                left = [
                {
                    id = "Network";
                }
                {
                    id = "Bluetooth";
                }
                {
                    id = "WallpaperSelector";
                }
                {
                    id = "NoctaliaPerformance";
                }
                ];
                right = [
                {
                    id = "Notifications";
                }
                {
                    id = "PowerProfile";
                }
                {
                    id = "KeepAwake";
                }
                {
                    id = "NightLight";
                }
                ];
            };
            cards = [
                {
                enabled = true;
                id = "profile-card";
                }
                {
                enabled = true;
                id = "shortcuts-card";
                }
                {
                enabled = true;
                id = "audio-card";
                }
                {
                enabled = false;
                id = "brightness-card";
                }
                {
                enabled = true;
                id = "weather-card";
                }
                {
                enabled = true;
                id = "media-sysmon-card";
                }
            ]; 
        };

        sessionMenu = {
            enableCountdown = true;
            countdownDuration = 10000;
            position = "center";
            showHeader = true;
            largeButtonsStyle = true;
            largeButtonsLayout = "single-row";
            showNumberLabels = true;
            powerOptions = [
                {
                action = "lock";
                enabled = true;
                }
                {
                action = "suspend";
                enabled = true;
                }
                {
                action = "hibernate";
                enabled = true;
                }
                {
                action = "reboot";
                enabled = true;
                }
                {
                action = "logout";
                enabled = true;
                }
                {
                action = "shutdown";
                enabled = true;
                }
            ]; 
        };
    
        calendar = {
            cards = [
                { enabled = true; id = "calendar-header-card"; }
                { enabled = true; id = "calendar-month-card"; }
                { enabled = true; id = "timer-card"; }
                { enabled = true; id = "weather-card"; }
            ]; 
        };

        hooks = {
            enabled = false;
            wallpaperChange = "";
            darkModeChange = "";
            screenLock = "";
            screenUnlock = "";
            performanceModeEnabled = "";
            performanceModeDisabled = "";
            startup = "";
            session = "";
        };
        desktopWidgets = {
            enabled = false;
            gridSnap = false;
            monitorWidgets = [ ];
        }; 
    };
}