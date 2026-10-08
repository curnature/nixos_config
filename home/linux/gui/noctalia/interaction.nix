{ ... }:
{
    programs.noctalia.settings = {
        shell = {
            # The v4 config disabled clipboard history while binding a shortcut
            # to it. Keep the panel functional under v5's native clipboard API.
            clipboard_enabled = true;
            clipboard_keep_from_closed_apps = true;
            clipboard_auto_paste = "off";
            launch_apps_as_systemd_services = false;
            app_icon_colorize = false;

            panel = {
                launcher_placement = "floating";
                launcher_position = "center";
                clipboard_placement = "floating";
                clipboard_position = "center";
                control_center_placement = "attached";
                open_near_click_control_center = true;
                session_placement = "floating";
                session_position = "center";
            };

            launcher = {
                categories = true;
                show_icons = true;
                app_grid = false;
                sort_by_usage = true;
                pinned = [ ];
                auto_paste = "off";
                providers.windows.global = true;
            };

            session = {
                grid = false;
                show_shortcuts = true;
                actions = [
                    {
                        action = "lock";
                        countdown_seconds = 10.0;
                    }
                    {
                        action = "lock_and_suspend";
                        countdown_seconds = 10.0;
                    }
                    {
                        # v5 has no built-in hibernate action, so retain the v4
                        # button as a documented custom systemd command.
                        action = "command";
                        label = "Hibernate";
                        glyph = "zzz";
                        command = "systemctl hibernate";
                        countdown_seconds = 10.0;
                    }
                    {
                        action = "reboot";
                        countdown_seconds = 10.0;
                    }
                    {
                        action = "logout";
                        countdown_seconds = 10.0;
                    }
                    {
                        action = "shutdown";
                        variant = "destructive";
                        countdown_seconds = 10.0;
                    }
                ];
            };
        };

        dock = {
            enabled = true;
            position = "bottom";
            background_opacity = 1.0;
            auto_hide = true;
            smart_auto_hide = false;
            reserve_space = false;
            active_monitor_only = true;
            pinned = [ ];
            inactive_opacity = 0.6;
            show_dots = false;
        };

        # v5 accepts at most six Home shortcuts. Power profiles remain available
        # through the battery widget and the Control Center Power tab.
        control_center = {
            shortcuts = [
                { type = "wifi"; }
                { type = "bluetooth"; }
                { type = "wallpaper"; }
                { type = "notification"; }
                { type = "caffeine"; }
                { type = "nightlight"; }
            ];

            calendar = {
                show_events_card = true;
                show_week_numbers = false;
            };
        };

        desktop_widgets.enabled = false;
    };

    # -------------------------------------------------------------------------
    # Previous Noctalia v4 settings
    # -------------------------------------------------------------------------
    # Outdated: v4 used camelCase JSON-style sections. Restore this entire block
    # only with the v4 package and old `noctalia-shell ipc call` keybindings.
    # programs.noctalia.settings = {
    #     appLauncher = {
    #         enableClipboardHistory = false;
    #         autoPasteClipboard = false;
    #         enableClipPreview = true;
    #         clipboardWrapText = true;
    #         clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
    #         clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
    #         position = "center";
    #         pinnedApps = [ ];
    #         useApp2Unit = false;
    #         sortByMostUsed = true;
    #         terminalCommand = "kitty";
    #         customLaunchPrefixEnabled = false;
    #         customLaunchPrefix = "";
    #         viewMode = "list";
    #         showCategories = true;
    #         iconMode = "tabler";
    #         showIconBackground = false;
    #         enableSettingsSearch = true;
    #         enableWindowsSearch = true;
    #         ignoreMouseInput = false;
    #         screenshotAnnotationTool = "";
    #     };
    #
    #     dock = {
    #         enabled = true;
    #         position = "bottom";
    #         displayMode = "auto_hide";
    #         backgroundOpacity = 1;
    #         floatingRatio = 1;
    #         size = 1;
    #         onlySameOutput = true;
    #         monitors = [ ];
    #         pinnedApps = [ ];
    #         colorizeIcons = false;
    #         pinnedStatic = false;
    #         inactiveIndicators = false;
    #         deadOpacity = 0.6;
    #         animationSpeed = 1;
    #     };
    #
    #     controlCenter = {
    #         position = "close_to_bar_button";
    #         diskPath = "/";
    #         shortcuts = {
    #             left = [
    #                 { id = "Network"; }
    #                 { id = "Bluetooth"; }
    #                 { id = "WallpaperSelector"; }
    #                 { id = "NoctaliaPerformance"; }
    #             ];
    #             right = [
    #                 { id = "Notifications"; }
    #                 { id = "PowerProfile"; }
    #                 { id = "KeepAwake"; }
    #                 { id = "NightLight"; }
    #             ];
    #         };
    #         cards = [
    #             { enabled = true; id = "profile-card"; }
    #             { enabled = true; id = "shortcuts-card"; }
    #             { enabled = true; id = "audio-card"; }
    #             { enabled = false; id = "brightness-card"; }
    #             { enabled = true; id = "weather-card"; }
    #             { enabled = true; id = "media-sysmon-card"; }
    #         ];
    #     };
    #
    #     sessionMenu = {
    #         enableCountdown = true;
    #         countdownDuration = 10000;
    #         position = "center";
    #         showHeader = true;
    #         largeButtonsStyle = true;
    #         largeButtonsLayout = "single-row";
    #         showNumberLabels = true;
    #         powerOptions = [
    #             { action = "lock"; enabled = true; }
    #             { action = "suspend"; enabled = true; }
    #             { action = "hibernate"; enabled = true; }
    #             { action = "reboot"; enabled = true; }
    #             { action = "logout"; enabled = true; }
    #             { action = "shutdown"; enabled = true; }
    #         ];
    #     };
    #
    #     calendar = {
    #         cards = [
    #             { enabled = true; id = "calendar-header-card"; }
    #             { enabled = true; id = "calendar-month-card"; }
    #             { enabled = true; id = "timer-card"; }
    #             { enabled = true; id = "weather-card"; }
    #         ];
    #     };
    #
    #     hooks = {
    #         enabled = false;
    #         wallpaperChange = "";
    #         darkModeChange = "";
    #         screenLock = "";
    #         screenUnlock = "";
    #         performanceModeEnabled = "";
    #         performanceModeDisabled = "";
    #         startup = "";
    #         session = "";
    #     };
    #     desktopWidgets = {
    #         enabled = false;
    #         gridSnap = false;
    #         monitorWidgets = [ ];
    #     };
    # };
}
