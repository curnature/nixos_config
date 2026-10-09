# Previous signature: { ... }:
# pkgs supplies the distro logo without a machine-specific store path.
{ pkgs, ... }:

let
    # v5 uses one metric per widget; share the v4 text-only monitor style.
    systemMonitorWidget = stat: {
        type = "sysmon";
        inherit stat;
        visualization = "none";
        show_value = true;
        show_glyph = true;
        font_family = "monospace";
    };
in
{
    programs.noctalia.settings = {
        # Noctalia v5 uses named bars and string widget identifiers.
        bar.main = {
            enabled = true;
            position = "top";
            # The initial v5 conversion used its default height, not v4's
            # comfortable density (37px bar with 29px capsules).
            # thickness = 34;
            thickness = 34;
            # Previously the empty bar area was tinted and requested compositor
            # blur. Keep the wallpaper clear while leaving widget capsules opaque.
            # background_opacity = 0.20;
            background_opacity = 0.20;
            # compositor_blur = true; # Previous implicit v5 default.
            compositor_blur = false;
            # v4 frameRadius=12 applied only to framed bars. Our simple bar
            # used 20px outer lower corners and square screen-edge corners.
            # radius = 12;
            radius = 12;
            radius_top_left = 0;
            radius_top_right = 0;
            concave_edge_corners = true;
            margin_ends = 0;
            margin_edge = 0;
            # frameThickness=8 was not simple-bar padding; v4 used marginS=6.
            # padding = 8;
            padding = 6;
            widget_spacing = 6;
            # A full-width bar shadow is unnecessary behind transparent gaps.
            # shadow = true;
            shadow = false;
            auto_hide = false;
            smart_auto_hide = false;
            reserve_space = true;
            capsule = true;
            capsule_thickness = 28.0 / 34.0;
            capsule_opacity = 0.60;

            start = [
                "launcher"
                "clock"
                # "sysmon" # Initial migration retained only CPU usage.
                "group:system-monitor"
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

            # Keep the restored readings together like the old SystemMonitor.
            # v5 has no built-in load-average bar stat; it remains available
            # in Control Center's System tab instead of using an invalid key.
            capsule_group = [
                {
                    id = "system-monitor";
                    members = [
                        "cpu-usage"
                        "cpu-temperature"
                        "gpu-usage"
                        "gpu-temperature"
                        "memory-usage"
                        "network-download"
                        "network-upload"
                    ];
                    opacity = 0.60;
                    accordion = false;
                }
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

            # Previous partial migration omitted the other enabled v4 stats.
            # sysmon = {
            #     stat = "cpu_usage";
            #     visualization = "none";
            #     show_value = true;
            #     show_glyph = true;
            # };
            cpu-usage = systemMonitorWidget "cpu_usage";
            cpu-temperature = systemMonitorWidget "cpu_temp";
            gpu-usage = systemMonitorWidget "gpu_usage";
            gpu-temperature = systemMonitorWidget "gpu_temp";
            memory-usage = systemMonitorWidget "ram_pct";
            network-download = systemMonitorWidget "net_rx";
            network-upload = systemMonitorWidget "net_tx";

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
                # Closest v5 equivalent to showProgressRing: a progress fill,
                # not a circular ring. Previously omitted (default false).
                show_progress = true;
            };

            notifications.hide_when_no_unread = false;

            battery = {
                display_mode = "glyph";
                show_label = true;
            };

            # Keep the v4 always-visible labels explicit. Volume's default
            # scroll step is already 5%; brightness needs its old 3% step.
            volume.show_label = true;
            brightness = {
                show_label = true;
                actions = {
                    scroll_up = "brightness-up 3%";
                    scroll_down = "brightness-down 3%";
                };
            };

            tray = {
                hidden = [ ];
                pinned = [ ];
                hide_passive = false;
                drawer = true;
            };

            # The glyph-only migration dropped v4's useDistroLogo=true.
            # control-center.glyph = "noctalia";
            control-center = {
                glyph = "noctalia"; # Fallback if the image cannot be loaded.
                custom_image = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                custom_image_colorize = false;
            };

            workspaces = {
                style = "regular";
                show_labels = true;
                show_icons = false;
                label_source = "id";
                max_label_chars = 2;
                focused_output_only = false;
                # Unlike focused_output_only (highlighting), this keeps each
                # bar's workspace list local to its own monitor, as in v4.
                show_all_outputs = false;
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
