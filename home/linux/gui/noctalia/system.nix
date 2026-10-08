{ ... }:
{
    programs.noctalia.settings = {
        accessibility.ui_scale = 1.0;

        shell = {
            time_format = "{:%H:%M}";
            telemetry_enabled = false;

            animation = {
                enabled = true;
                speed = 1.0;
            };

            screen_corners.enabled = false;
            panel = {
                borders = false;
                shadow = true;
            };
            mpris.blacklist = [ ];
        };

        lockscreen = {
            enabled = true;
            lock_before_suspend = true;
            fingerprint = false;
            tint_intensity = 0.2;
        };

        system.monitor = {
            enabled = true;
            cpu_poll_seconds = 1.0;
            gpu_poll_seconds = 3.0;
            memory_poll_seconds = 1.0;
            disk_poll_seconds = 30.0;
            network_poll_seconds = 1.0;

            cpu_usage_activity_threshold = 80;
            cpu_usage_critical_threshold = 90;
            cpu_temp_activity_threshold = 80;
            cpu_temp_critical_threshold = 90;
            gpu_temp_activity_threshold = 80;
            gpu_temp_critical_threshold = 90;
            ram_pct_activity_threshold = 80;
            ram_pct_critical_threshold = 90;
            swap_pct_activity_threshold = 80;
            swap_pct_critical_threshold = 90;
            disk_used_pct_activity_threshold = 80;
            disk_used_pct_critical_threshold = 90;
        };

        notification = {
            enable_daemon = true;
            position = "top_right";
            layer = "overlay";
            background_opacity = 1.0;
            monitors = [ ];
            keep_dismissed_in_history = true;
        };

        audio = {
            enable_overdrive = false;
            enable_sounds = false;
            enable_volume_sounds = false;
            enable_notification_sounds = false;
        };

        osd = {
            enabled = true;
            position = "top_right";
            hide_delay_ms = 2000;
            background_opacity = 1.0;
            monitors = [ ];
        };

        brightness.enable_ddcutil = false;
        battery.warning_threshold = 30;

        location = {
            auto_locate = false;
            address = "Tokyo";
        };

        weather = {
            enabled = true;
            effects = true;
            unit = "celsius";
        };
    };

    # -------------------------------------------------------------------------
    # Previous Noctalia v4 settings
    # -------------------------------------------------------------------------
    # Outdated: v4 used camelCase JSON-style sections and combined unrelated
    # lock-screen, notification, service, and UI settings under `general`.
    # Restore this entire block only with the v4 package.
    # programs.noctalia.settings = {
    #     general = {
    #         avatarImage = "";
    #         dimmerOpacity = 0.2;
    #         showScreenCorners = false;
    #         forceBlackScreenCorners = false;
    #         scaleRatio = 1;
    #         radiusRatio = 1;
    #         iRadiusRatio = 1;
    #         boxRadiusRatio = 1;
    #         screenRadiusRatio = 1;
    #         animationSpeed = 1;
    #         animationDisabled = false;
    #         compactLockScreen = false;
    #         lockOnSuspend = true;
    #         showSessionButtonsOnLockScreen = true;
    #         showHibernateOnLockScreen = false;
    #         enableShadows = true;
    #         shadowDirection = "bottom_right";
    #         shadowOffsetX = 2;
    #         shadowOffsetY = 3;
    #         language = "";
    #         allowPanelsOnScreenWithoutBar = true;
    #         showChangelogOnStartup = true;
    #         telemetryEnabled = false;
    #         enableLockScreenCountdown = true;
    #         lockScreenCountdownDuration = 10000;
    #         autoStartAuth = false;
    #         allowPasswordWithFprintd = false;
    #     };
    #
    #     systemMonitor = {
    #         cpuWarningThreshold = 80;
    #         cpuCriticalThreshold = 90;
    #         tempWarningThreshold = 80;
    #         tempCriticalThreshold = 90;
    #         gpuWarningThreshold = 80;
    #         gpuCriticalThreshold = 90;
    #         memWarningThreshold = 80;
    #         memCriticalThreshold = 90;
    #         swapWarningThreshold = 80;
    #         swapCriticalThreshold = 90;
    #         diskWarningThreshold = 80;
    #         diskCriticalThreshold = 90;
    #         cpuPollingInterval = 1000;
    #         gpuPollingInterval = 3000;
    #         enableDgpuMonitoring = false;
    #         memPollingInterval = 1000;
    #         diskPollingInterval = 30000;
    #         networkPollingInterval = 1000;
    #         loadAvgPollingInterval = 3000;
    #         useCustomColors = false;
    #         warningColor = "";
    #         criticalColor = "";
    #         externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
    #     };
    #
    #     notifications = {
    #         enabled = true;
    #         monitors = [ ];
    #         location = "top_right";
    #         overlayLayer = true;
    #         backgroundOpacity = 1;
    #         respectExpireTimeout = false;
    #         lowUrgencyDuration = 3;
    #         normalUrgencyDuration = 8;
    #         criticalUrgencyDuration = 15;
    #         enableKeyboardLayoutToast = true;
    #         saveToHistory = {
    #             low = true;
    #             normal = true;
    #             critical = true;
    #         };
    #         sounds = {
    #             enabled = false;
    #             volume = 0.5;
    #             separateSounds = false;
    #             criticalSoundFile = "";
    #             normalSoundFile = "";
    #             lowSoundFile = "";
    #             excludedApps = "discord,firefox,chrome,chromium,edge";
    #         };
    #         enableMediaToast = false;
    #     };
    #
    #     network = {
    #         wifiEnabled = true;
    #         bluetoothRssiPollingEnabled = false;
    #         bluetoothRssiPollIntervalMs = 10000;
    #         wifiDetailsViewMode = "grid";
    #         bluetoothDetailsViewMode = "grid";
    #         bluetoothHideUnnamedDevices = false;
    #     };
    #
    #     audio = {
    #         volumeStep = 5;
    #         volumeOverdrive = false;
    #         cavaFrameRate = 30;
    #         visualizerType = "linear";
    #         mprisBlacklist = [ ];
    #         preferredPlayer = "";
    #         volumeFeedback = false;
    #     };
    #
    #     osd = {
    #         enabled = true;
    #         location = "top_right";
    #         autoHideMs = 2000;
    #         overlayLayer = true;
    #         backgroundOpacity = 1;
    #         enabledTypes = [
    #             0
    #             1
    #             2
    #         ];
    #         monitors = [ ];
    #     };
    #
    #     brightness = {
    #         brightnessStep = 3;
    #         enforceMinimum = true;
    #         enableDdcSupport = false;
    #     };
    #
    #     location = {
    #         name = "Tokyo";
    #         weatherEnabled = true;
    #         weatherShowEffects = true;
    #         useFahrenheit = false;
    #         use12hourFormat = false;
    #         showWeekNumberInCalendar = false;
    #         showCalendarEvents = true;
    #         showCalendarWeather = true;
    #         analogClockInCalendar = false;
    #         firstDayOfWeek = -1;
    #         hideWeatherTimezone = false;
    #         hideWeatherCityName = false;
    #     };
    # };
}
