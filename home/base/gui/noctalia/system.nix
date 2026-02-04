{ ... }:
{
    programs.noctalia-shell.settings = {
        general = {
      # Critical system settings
            avatarImage = "";
            dimmerOpacity = 0.2;
            showScreenCorners = false;
            forceBlackScreenCorners = false;
            scaleRatio = 1;
            radiusRatio = 1;
            iRadiusRatio = 1;
            boxRadiusRatio = 1;
            screenRadiusRatio = 1;
            animationSpeed = 1;
            animationDisabled = false;
            compactLockScreen = false;
            lockOnSuspend = true;
            showSessionButtonsOnLockScreen = true;
            showHibernateOnLockScreen = false;
            enableShadows = true;
            shadowDirection = "bottom_right";
            shadowOffsetX = 2;
            shadowOffsetY = 3;
            language = "";
            allowPanelsOnScreenWithoutBar = true;
            showChangelogOnStartup = true;
            telemetryEnabled = false;
            enableLockScreenCountdown = true;
            lockScreenCountdownDuration = 10000;
            autoStartAuth = false;
            allowPasswordWithFprintd = false;
        };

        systemMonitor = {
            cpuWarningThreshold = 80;
            cpuCriticalThreshold = 90;
            tempWarningThreshold = 80;
            tempCriticalThreshold = 90;
            gpuWarningThreshold = 80;
            gpuCriticalThreshold = 90;
            memWarningThreshold = 80;
            memCriticalThreshold = 90;
            swapWarningThreshold = 80;
            swapCriticalThreshold = 90;
            diskWarningThreshold = 80;
            diskCriticalThreshold = 90;
            cpuPollingInterval = 1000;
            gpuPollingInterval = 3000;
            enableDgpuMonitoring = false;
            memPollingInterval = 1000;
            diskPollingInterval = 30000;
            networkPollingInterval = 1000;
            loadAvgPollingInterval = 3000;
            useCustomColors = false;
            warningColor = "";
            criticalColor = "";
            externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
        };

        notifications = {
            enabled = true;
            monitors = [ ];
            location = "top_right";
            overlayLayer = true;
            backgroundOpacity = 1;
            respectExpireTimeout = false;
            lowUrgencyDuration = 3;
            normalUrgencyDuration = 8;
            criticalUrgencyDuration = 15;
            enableKeyboardLayoutToast = true;
            saveToHistory = {
                low = true;
                normal = true;
                critical = true;
            };
            sounds = {
                enabled = false;
                volume = 0.5;
                separateSounds = false;
                criticalSoundFile = "";
                normalSoundFile = "";
                lowSoundFile = "";
                excludedApps = "discord,firefox,chrome,chromium,edge";
            };
            enableMediaToast = false;
        };

        network = {
            wifiEnabled = true;
            bluetoothRssiPollingEnabled = false;
            bluetoothRssiPollIntervalMs = 10000;
            wifiDetailsViewMode = "grid";
            bluetoothDetailsViewMode = "grid";
            bluetoothHideUnnamedDevices = false;
        };

        audio = {
            volumeStep = 5;
            volumeOverdrive = false;
            cavaFrameRate = 30;
            visualizerType = "linear";
            mprisBlacklist = [ ];
            preferredPlayer = "";
            volumeFeedback = false;
        };
    
        osd = {
            enabled = true;
            location = "top_right";
            autoHideMs = 2000;
            overlayLayer = true;
            backgroundOpacity = 1;
            enabledTypes = [
                0
                1
                2
            ];
            monitors = [ ];
        };

        brightness = {
            brightnessStep = 3;
            enforceMinimum = true;
            enableDdcSupport = false;
        }; 

        location = {
            name = "Tokyo";
            weatherEnabled = true;
            weatherShowEffects = true;
            useFahrenheit = false;
            use12hourFormat = false;
            showWeekNumberInCalendar = false;
            showCalendarEvents = true;
            showCalendarWeather = true;
            analogClockInCalendar = false;
            firstDayOfWeek = -1;
            hideWeatherTimezone = false;
            hideWeatherCityName = false;
        };
    };
}