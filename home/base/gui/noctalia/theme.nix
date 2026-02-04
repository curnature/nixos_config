{ ... }:
{
    home.file.".cache/noctalia/wallpapers.json".text = builtins.toJSON {
        defaultWallpaper = "${../../../../wallpapers/plana_bg2_2560_1440.jpg}";
        # If you have multiple monitors, you can specify them:
        # wallpapers = {
        #   "eDP-1" = "${../../../../wallpapers/laptop_bg.jpg}";
        #   "HDMI-A-1" = "${../../../../wallpapers/monitor_bg.jpg}";
        # };
    };

    programs.noctalia-shell.settings = {
        # --- Wallpaper ---
        wallpaper = {
            enabled = true;
            overviewEnabled = false;
            directory = "${../../../../wallpapers}";
            monitorDirectories = [ ];
            enableMultiMonitorDirectories = false;
            showHiddenFiles = false;
            viewMode = "single";
            setWallpaperOnAllMonitors = true;
            fillMode = "crop";
            fillColor = "#000000";
            useSolidColor = false;
            solidColor = "#1a1a2e";
            automationEnabled = false;
            wallpaperChangeMode = "random";
            randomIntervalSec = 300;
            transitionDuration = 1500;
            transitionType = "random";
            transitionEdgeSmoothness = 0.05;
            panelPosition = "follow_bar";
            hideWallpaperFilenames = false;
            useWallhaven = false;
            wallhavenQuery = "";
            wallhavenSorting = "relevance";
            wallhavenOrder = "desc";
            wallhavenCategories = "111";
            wallhavenPurity = "100";
            wallhavenRatios = "";
            wallhavenApiKey = "";
            wallhavenResolutionMode = "atleast";
            wallhavenResolutionWidth = "";
            wallhavenResolutionHeight = "";
            sortOrder = "name"; 
        };

        # --- Theme ---
        colorSchemes = {
            useWallpaperColors = true;
            predefinedScheme = "Noctalia (default)";
            darkMode = true;
            schedulingMode = "off";
            manualSunrise = "06:30";
            manualSunset = "18:30";
            generationMethod = "tonal-spot";
            monitorForColors = "";
        };
        templates = {
            activeTemplates = [ ];
            enableUserTheming = false;
        };
        nightLight = {
            enabled = false;
            forced = false;
            autoSchedule = true;
            nightTemp = "4000";
            dayTemp = "6500";
            manualSunrise = "06:30";
            manualSunset = "18:30";
        }; 

        # --- UI & Density ---
        ui = {
            fontDefault = "";
            fontFixed = "";
            fontDefaultScale = 1;
            fontFixedScale = 1;
            tooltipsEnabled = true;
            panelBackgroundOpacity = 0.93;
            panelsAttachedToBar = true;
            settingsPanelMode = "attached";
            wifiDetailsViewMode = "grid";
            bluetoothDetailsViewMode = "grid";
            networkPanelView = "wifi";
            bluetoothHideUnnamedDevices = false;
            boxBorderEnabled = false; 
        };

        
    };
}
