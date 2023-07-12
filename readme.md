
# Windows Install Scripts

## Summary
This repo contains scripts to enable automated windows configuration.
The goal of this repo is 3 fold
1. Ensure reproducibilty across multiple devices
2. Allow recovery in case of catostrophic failure
3. Enaable fully text based git version controlling of windows configuraation. 

# Usage

Install packags from declarative config
```
winget import --import-file ./packages.json
```

Install packages one off
```
winget install --exact --id Rustlang.Rustup
```

Export declarative config
```
winget export --output ./packages.json
```