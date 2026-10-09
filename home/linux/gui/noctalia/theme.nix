{ ... }:
{
    programs.noctalia.settings = {
        # Noctalia v5 stores the selected wallpaper in its TOML config rather
        # than the v4 JSON cache file under ~/.cache.
        wallpaper = {
            enabled = true;
            directory = "${../../../../wallpapers}";
            fill_mode = "crop";
            fill_color = "#000000";
            transition = [
                "fade"
                "wipe"
                "disc"
                "stripes"
                "zoom"
                "honeycomb"
            ];
            transition_duration = 1500;
            edge_smoothness = 0.05;
            # v4 animated the initial wallpaper; the first v5 conversion did not.
            # transition_on_startup = false;
            transition_on_startup = true;
            per_monitor_directories = false;

            default.path = "${../../../../wallpapers/BA_alicekey_bg3_2560_1440.png}";

            automation = {
                enabled = false;
                interval_seconds = 300;
                order = "random";
                recursive = true;
            };
        };

        theme = {
            mode = "dark";
            source = "wallpaper";
            wallpaper_scheme = "m3-tonal-spot";
        };

        # v5's backdrop replaces noctalia-overview, but our v4 overviewEnabled
        # was false. Keep the Niri layer rule harmlessly available if re-enabled.
        backdrop = {
            # enabled = true; # Initial migration enabled an unwanted feature.
            enabled = false;
            blur_intensity = 0.5;
            tint_intensity = 0.3;
        };

        nightlight = {
            enabled = false;
            force = false;
            temperature_night = 4000;
            temperature_day = 6500;
        };

        shell = {
            # v4's Qt configuration selected this family. v5 does not read
            # qt6ct; retain its native text sizes rather than copying Qt's 14pt.
            font_family = "CommitMono Nerd Font";

            # v4 bottom_right used offsets (2,3); v5 down_right uses (2,2).
            # Previously omitted, so v5 defaulted to straight-down shadows.
            shadow.direction = "down_right";

            panel = {
                # Same setting, regrouped with the panel appearance below:
                # shell.panel.wallpaper_show_names = true;
                wallpaper_show_names = true;
                # v4 panelBackgroundOpacity=0.93 has no exact v5 equivalent.
                # Keep opaque cards/readable floating panels; attached panel
                # backgrounds inherit the bar's opacity. This is an approximation.
                transparency_mode = "solid";
            };
        };
    };

    # -------------------------------------------------------------------------
    # Previous Noctalia v4 settings
    # -------------------------------------------------------------------------
    # Outdated: v5 reads `wallpaper.default.path` from config.toml and no longer
    # uses this mutable JSON cache. Restore only with Noctalia v4.
    # home.file.".cache/noctalia/wallpapers.json".text = builtins.toJSON {
    #     defaultWallpaper = "${../../../../wallpapers/BA_alicekey_bg3_2560_1440.png}";
    #     # If you have multiple monitors, you can specify them:
    #     # wallpapers = {
    #     #     "eDP-1" = "${../../../../wallpapers/laptop_bg.jpg}";
    #     #     "HDMI-A-1" = "${../../../../wallpapers/monitor_bg.jpg}";
    #     # };
    # };
    #
    # Outdated: v4 used camelCase JSON-style keys. Restore this block only with
    # the v4 package and the old compositor commands.
    # programs.noctalia.settings = {
    #     wallpaper = {
    #         enabled = true;
    #         overviewEnabled = false;
    #         directory = "${../../../../wallpapers}";
    #         monitorDirectories = [ ];
    #         enableMultiMonitorDirectories = false;
    #         showHiddenFiles = false;
    #         viewMode = "single";
    #         setWallpaperOnAllMonitors = true;
    #         fillMode = "crop";
    #         fillColor = "#000000";
    #         useSolidColor = false;
    #         solidColor = "#1a1a2e";
    #         automationEnabled = false;
    #         wallpaperChangeMode = "random";
    #         randomIntervalSec = 300;
    #         transitionDuration = 1500;
    #         transitionType = "random";
    #         transitionEdgeSmoothness = 0.05;
    #         panelPosition = "follow_bar";
    #         hideWallpaperFilenames = false;
    #         useWallhaven = false;
    #         wallhavenQuery = "";
    #         wallhavenSorting = "relevance";
    #         wallhavenOrder = "desc";
    #         wallhavenCategories = "111";
    #         wallhavenPurity = "100";
    #         wallhavenRatios = "";
    #         wallhavenApiKey = "";
    #         wallhavenResolutionMode = "atleast";
    #         wallhavenResolutionWidth = "";
    #         wallhavenResolutionHeight = "";
    #         sortOrder = "name";
    #     };
    #
    #     colorSchemes = {
    #         useWallpaperColors = true;
    #         predefinedScheme = "Noctalia (default)";
    #         darkMode = true;
    #         schedulingMode = "off";
    #         manualSunrise = "06:30";
    #         manualSunset = "18:30";
    #         generationMethod = "tonal-spot";
    #         monitorForColors = "";
    #     };
    #     templates = {
    #         activeTemplates = [ ];
    #         enableUserTheming = false;
    #     };
    #     nightLight = {
    #         enabled = false;
    #         forced = false;
    #         autoSchedule = true;
    #         nightTemp = "4000";
    #         dayTemp = "6500";
    #         manualSunrise = "06:30";
    #         manualSunset = "18:30";
    #     };
    #
    #     ui = {
    #         fontDefault = "";
    #         fontFixed = "";
    #         fontDefaultScale = 1;
    #         fontFixedScale = 1;
    #         tooltipsEnabled = true;
    #         panelBackgroundOpacity = 0.93;
    #         panelsAttachedToBar = true;
    #         settingsPanelMode = "attached";
    #         wifiDetailsViewMode = "grid";
    #         bluetoothDetailsViewMode = "grid";
    #         networkPanelView = "wifi";
    #         bluetoothHideUnnamedDevices = false;
    #         boxBorderEnabled = false;
    #     };
    # };
}
