{ ... }:
{
    programs.noctalia.settings = {
        # Noctalia v5 uses named bars and string widget identifiers.
        bar.main = {
            enabled = true;
            position = "top";
            thickness = 34;
            background_opacity = 0.20;
            radius = 12;
            margin_ends = 0;
            margin_edge = 0;
            padding = 8;
            widget_spacing = 6;
            shadow = true;
            auto_hide = false;
            smart_auto_hide = false;
            reserve_space = true;
            capsule = true;
            capsule_opacity = 1.0;

            start = [
                "launcher"
                "clock"
                "sysmon"
                "active_window"
                "media"
            ];
            center = [ "workspaces" ];
            end = [
                "notifications"
                "battery"
                "volume"
                "brightness"
                "tray"
                "control-center"
            ];
        };

        # Widget-specific settings moved out of inline v4 widget objects.
        widget = {
            launcher.glyph = "rocket";

            clock = {
                format = "{:%H:%M %a, %b %d}";
                vertical_format = "{:%H\n%M - %d\n%m}";
                tooltip_format = "{:%H:%M %a, %b %d}";
            };

            sysmon = {
                stat = "cpu_usage";
                visualization = "none";
                show_value = true;
                show_glyph = true;
            };

            active_window = {
                max_length = 145;
                title_scroll = "on_hover";
                display = "icon_and_text";
                show_empty_label = false;
            };

            media = {
                hide_album_art = true;
                artist_first = true;
                max_length = 145;
                title_scroll = "on_hover";
                hide_when_no_media = true;
                hide_when_idle = false;
            };

            notifications.hide_when_no_unread = false;

            battery = {
                display_mode = "glyph";
                show_label = true;
            };

            tray = {
                hidden = [ ];
                pinned = [ ];
                hide_passive = false;
                drawer = true;
            };

            control-center.glyph = "noctalia";

            workspaces = {
                style = "regular";
                show_labels = true;
                show_icons = false;
                label_source = "id";
                max_label_chars = 2;
                focused_output_only = false;
                labels_only_when_occupied = true;
                hide_when_empty = false;
            };
        };
    };

    # -------------------------------------------------------------------------
    # Previous Noctalia v4 settings
    # -------------------------------------------------------------------------
    # Outdated: v4 used one anonymous bar with camelCase fields and inline
    # widget objects. Restore this entire block only with the old v4 input and
    # the old `noctalia-shell` startup/IPC commands.
    # programs.noctalia.settings.bar = {
    #     barType = "simple";
    #     position = "top";
    #     monitors = [ ];
    #     density = "comfortable";
    #     showOutline = false;
    #     showCapsule = true;
    #     capsuleOpacity = 1;
    #     backgroundOpacity = 0.20;
    #     useSeparateOpacity = true;
    #     floating = false;
    #     marginVertical = 0.25;
    #     marginHorizontal = 0.25;
    #     frameThickness = 8;
    #     frameRadius = 12;
    #     outerCorners = true;
    #     hideOnOverview = false;
    #     displayMode = "always_visible";
    #     autoHideDelay = 500;
    #     autoShowDelay = 150;
    #     widgets = {
    #         center = [
    #             {
    #                 id = "Workspace";
    #                 characterCount = 2;
    #                 colorizeIcons = false;
    #                 enableScrollWheel = true;
    #                 followFocusedScreen = false;
    #                 groupedBorderOpacity = 1;
    #                 hideUnoccupied = false;
    #                 iconScale = 0.8;
    #                 labelMode = "index";
    #                 showApplications = false;
    #                 showLabelsOnlyWhenOccupied = true;
    #                 unfocusedIconsOpacity = 1;
    #             }
    #         ];
    #         left = [
    #             {
    #                 id = "Launcher";
    #                 icon = "rocket";
    #                 usePrimaryColor = false;
    #             }
    #             {
    #                 id = "Clock";
    #                 customFont = "";
    #                 formatHorizontal = "HH:mm ddd, MMM dd";
    #                 formatVertical = "HH mm - dd MM";
    #                 tooltipFormat = "HH:mm ddd, MMM dd";
    #                 useCustomFont = false;
    #                 usePrimaryColor = false;
    #             }
    #             {
    #                 id = "SystemMonitor";
    #                 compactMode = false;
    #                 diskPath = "/persistent";
    #                 showCpuTemp = true;
    #                 showCpuUsage = true;
    #                 showDiskUsage = false;
    #                 showGpuTemp = true;
    #                 showLoadAverage = true;
    #                 showMemoryAsPercent = true;
    #                 showMemoryUsage = true;
    #                 showNetworkStats = true;
    #                 useMonospaceFont = true;
    #                 usePrimaryColor = false;
    #             }
    #             {
    #                 id = "ActiveWindow";
    #                 colorizeIcons = false;
    #                 hideMode = "hidden";
    #                 maxWidth = 145;
    #                 scrollingMode = "hover";
    #                 showIcon = true;
    #                 useFixedWidth = false;
    #             }
    #             {
    #                 id = "MediaMini";
    #                 hideMode = "hidden";
    #                 hideWhenIdle = false;
    #                 maxWidth = 145;
    #                 scrollingMode = "hover";
    #                 showAlbumArt = false;
    #                 showArtistFirst = true;
    #                 showProgressRing = true;
    #                 showVisualizer = false;
    #                 useFixedWidth = false;
    #                 visualizerType = "linear";
    #             }
    #         ];
    #         right = [
    #             # {
    #             #     id = "ScreenRecorder";
    #             # }
    #             {
    #                 id = "NotificationHistory";
    #                 hideWhenZero = false;
    #                 showUnreadBadge = true;
    #             }
    #             {
    #                 id = "Battery";
    #                 deviceNativePath = "";
    #                 displayMode = "alwaysShow";
    #                 hideIfNotDetected = true;
    #                 showNoctaliaPerformance = true;
    #                 showPowerProfiles = true;
    #                 warningThreshold = 30;
    #             }
    #             {
    #                 id = "Volume";
    #                 displayMode = "alwaysShow";
    #             }
    #             {
    #                 id = "Brightness";
    #                 displayMode = "alwaysShow";
    #             }
    #             {
    #                 id = "Tray";
    #                 blacklist = [ ];
    #                 colorizeIcons = false;
    #                 drawerEnabled = true;
    #                 hidePassive = false;
    #                 pinned = [ ];
    #             }
    #             {
    #                 id = "ControlCenter";
    #                 colorizeDistroLogo = false;
    #                 colorizeSystemIcon = "none";
    #                 customIconPath = "";
    #                 enableColorization = false;
    #                 icon = "noctalia";
    #                 useDistroLogo = true;
    #             }
    #         ];
    #     };
    #     screenOverrides = [ ];
    # };
}
