{ lib, pkgs, ... }:

let
    # No acceptable kernel is selected yet. Replace null with a named package
    # attribute only after Nixpkgs provides a supported, Framework-tested series
    # newer than 7.2, for example "linuxPackages_7_3" when such an attribute
    # actually exists in the pinned revision.
    #
    # Do not use "linuxPackages_latest": that alias can change major series on
    # any lock-file update. Do not restore 7.0 or 7.1 from an older Nixpkgs pin:
    # both series are end-of-life. Linux 7.2 is intentionally rejected because
    # of the Framework 13 Pro regressions identified before this host was added.
    selectedKernelAttribute = null;

    attributeExists =
        selectedKernelAttribute != null
        && builtins.hasAttr selectedKernelAttribute pkgs;

    attributeIsNamedSeries =
        selectedKernelAttribute != null
        && builtins.match "linuxPackages_[0-9]+_[0-9]+" selectedKernelAttribute != null;

    selectedKernelSeriesMatch =
        if attributeIsNamedSeries then
            builtins.match "linuxPackages_([0-9]+)_([0-9]+)" selectedKernelAttribute
        else
            null;

    selectedKernelSeries =
        if selectedKernelSeriesMatch != null then
            "${builtins.elemAt selectedKernelSeriesMatch 0}.${builtins.elemAt selectedKernelSeriesMatch 1}"
        else
            null;

    seriesIsAllowed =
        selectedKernelSeries != null
        && lib.versionAtLeast selectedKernelSeries "7.0"
        && !(lib.versionAtLeast selectedKernelSeries "7.0"
            && lib.versionOlder selectedKernelSeries "7.2")
        && !(lib.versionAtLeast selectedKernelSeries "7.2"
            && lib.versionOlder selectedKernelSeries "7.3");

    selectedKernelPackages =
        if attributeExists && seriesIsAllowed then
            builtins.getAttr selectedKernelAttribute pkgs
        else
            null;

    selectedKernelVersion =
        if selectedKernelPackages != null then
            selectedKernelPackages.kernel.version
        else
            null;
in
{
    assertions = [
        {
            assertion = selectedKernelAttribute != null;
            message = ''
                Select a supported, named Framework kernel series in
                nixos/kernel.nix before enabling the fw13p configuration.
            '';
        }
        {
            assertion = selectedKernelAttribute == null || attributeIsNamedSeries;
            message = ''
                The Framework kernel must use a named linuxPackages_X_Y
                attribute; aliases such as linuxPackages_latest are forbidden.
            '';
        }
        {
            assertion = selectedKernelAttribute == null || attributeExists;
            message = ''
                The selected Framework kernel package does not exist in the
                pinned Nixpkgs revision. Update the pin or choose a supported
                named series; do not fall back silently.
            '';
        }
        {
            assertion =
                selectedKernelSeries == null
                || lib.versionAtLeast selectedKernelSeries "7.0";
            message = "The Framework 13 Pro kernel must be Linux 7.0 or newer.";
        }
        {
            assertion =
                selectedKernelSeries == null
                || !(lib.versionAtLeast selectedKernelSeries "7.0"
                    && lib.versionOlder selectedKernelSeries "7.2");
            message = "Linux 7.0 and 7.1 are end-of-life and cannot be selected.";
        }
        {
            assertion =
                selectedKernelSeries == null
                || !(lib.versionAtLeast selectedKernelSeries "7.2"
                    && lib.versionOlder selectedKernelSeries "7.3");
            message = "Linux 7.2 is intentionally excluded for the Framework 13 Pro.";
        }
        {
            assertion =
                selectedKernelVersion == null
                || lib.versionAtLeast selectedKernelVersion "7.0";
            message = "The selected kernel package resolved below Linux 7.0.";
        }
    ];
}
// lib.optionalAttrs (selectedKernelPackages != null) {
    boot.kernelPackages = selectedKernelPackages;
}
