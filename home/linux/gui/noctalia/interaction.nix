{ ... }:
{
    programs.noctalia.settings = {
        shell = {
            # Deliberate v5 choice: keep native clipboard integration/history
            # enabled, unlike v4's disabled history. Setting this false also
            # disables Noctalia text-field clipboard integration.
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
                # Six v4 buttons fit one row; v5 supports at most five columns
                # and lays these six out in two rows. No exact header/row option.
                grid = false;
                # Previously true without per-action shortcuts, so no numbers
                # were shown. Explicit shortcuts restore v4's number labels.
                show_shortcuts = true;
                actions = [
                    {
                        action = "lock";
                        shortcut = "1";
                        countdown_seconds = 10.0;
                    }
                    {
                        action = "lock_and_suspend";
                        shortcut = "2";
                        countdown_seconds = 10.0;
                    }
                    {
                        # v5 has no built-in hibernate action, so retain the v4
                        # button as a documented custom systemd command.
                        action = "command";
                        label = "Hibernate";
                        glyph = "zzz";
                        command = "systemctl hibernate";
                        shortcut = "3";
                        countdown_seconds = 10.0;
                    }
                    {
                        action = "reboot";
                        shortcut = "4";
                        countdown_seconds = 10.0;
                    }
                    {
                        action = "logout";
                        shortcut = "5";
                        countdown_seconds = 10.0;
                    }
                    {
                        action = "shutdown";
                        shortcut = "6";
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
            # Previously omitted geometry inherited v5's 48px icons and zero
            # edge gap. v4 size=1/floatingRatio=1 meant 36px icons and a 13px gap.
            icon_size = 36;
            margin_edge = 13;
            radius = 20;
            concave_edge_corners = false;
            item_spacing = 6;

            # Match v4's normal size and gentle 1.15 hover enlargement; v5's
            # magnification spreads to adjacent icons, so this is approximate.
            active_scale = 1.0;
            inactive_scale = 1.0;
            magnification_scale = 1.15;

            # v4 deadOpacity dimmed non-running pinned apps (we have no pins),
            # not unfocused running apps as v5 inactive_opacity does.
            # inactive_opacity = 0.6;
            inactive_opacity = 1.0;
            # v4 showed only the focused app's indicator. v5 has only all-running
            # dots or none; retain the existing no-dots approximation.
            show_dots = false;
        };

        # v5 accepts at most six Home shortcuts. Power profiles remain available
        # through the battery widget and the Control Center Power tab.
        # NoctaliaPerformance has no direct v5 counterpart. The old configurable
        # card order, timer card, and launcher settings search have no built-in
        # equivalents; do not invent cards/providers to imitate those settings.
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
