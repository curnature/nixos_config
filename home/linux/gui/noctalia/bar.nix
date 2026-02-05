{ ... }:
{
    programs.noctalia-shell.settings.bar = {
        barType = "simple";
        position = "top";
        monitors = [ ];
        density = "comfortable";
        showOutline = false;
        showCapsule = true;
        capsuleOpacity = 1;
        backgroundOpacity = 0.20;
        useSeparateOpacity = true;
        floating = false;
        marginVertical = 0.25;
        marginHorizontal = 0.25;
        frameThickness = 8;
        frameRadius = 12;
        outerCorners = true;
        hideOnOverview = false;
        displayMode = "always_visible";
        autoHideDelay = 500;
        autoShowDelay = 150;
        widgets = {
            center = [
                {
                id = "Workspace";
                characterCount = 2;
                colorizeIcons = false;
                enableScrollWheel = true;
                followFocusedScreen = false;
                groupedBorderOpacity = 1;
                hideUnoccupied = false;
                iconScale = 0.8;
                labelMode = "index";
                showApplications = false;
                showLabelsOnlyWhenOccupied = true;
                unfocusedIconsOpacity = 1;
                }
            ];
            left = [
                {
                id = "Launcher";
                icon = "rocket";
                usePrimaryColor = false;
                }
                {
                id = "Clock";
                customFont = "";
                formatHorizontal = "HH:mm ddd, MMM dd";
                formatVertical = "HH mm - dd MM";
                tooltipFormat = "HH:mm ddd, MMM dd";
                useCustomFont = false;
                usePrimaryColor = false;
                }
                {
                id = "SystemMonitor";
                compactMode = false;
                diskPath = "/persistent";
                showCpuTemp = true;
                showCpuUsage = true;
                showDiskUsage = false;
                showGpuTemp = true;
                showLoadAverage = true;
                showMemoryAsPercent = true;
                showMemoryUsage = true;
                showNetworkStats = true;
                useMonospaceFont = true;
                usePrimaryColor = false;
                }
                {
                id = "ActiveWindow";
                colorizeIcons = false;
                hideMode = "hidden";
                maxWidth = 145;
                scrollingMode = "hover";
                showIcon = true;
                useFixedWidth = false;
                }
                {
                id = "MediaMini";
                hideMode = "hidden";
                hideWhenIdle = false;
                maxWidth = 145;
                scrollingMode = "hover";
                showAlbumArt = false;
                showArtistFirst = true;
                showProgressRing = true;
                showVisualizer = false;
                useFixedWidth = false;
                visualizerType = "linear";
                }
            ];
            right = [
                # {
                # id = "ScreenRecorder";
                # }
                {
                id = "NotificationHistory";
                hideWhenZero = false;
                showUnreadBadge = true;
                }
                {
                id = "Battery";
                deviceNativePath = "";
                displayMode = "alwaysShow";
                hideIfNotDetected = true;
                showNoctaliaPerformance = true;
                showPowerProfiles = true;
                warningThreshold = 30;
                }
                {
                id = "Volume";
                displayMode = "alwaysShow";
                }
                {
                id = "Brightness";
                displayMode = "alwaysShow";
                }
                {
                id = "Tray";
                blacklist = [];
                colorizeIcons = false;
                drawerEnabled = true;
                hidePassive = false;
                pinned = [];
                }
                {
                id = "ControlCenter";
                colorizeDistroLogo = false;
                colorizeSystemIcon = "none";
                customIconPath = "";
                enableColorization = false;
                icon = "noctalia";
                useDistroLogo = true;
                }
            ];
        }; 
        screenOverrides = [ ]; 
    };
}