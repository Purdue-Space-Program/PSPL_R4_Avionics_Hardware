#!/usr/bin/bash

boards=(
    stm
    DAQ_dev_board
    power_systems
    "RF System"
    "Data Storage and Recovery Dev Circuit"
)

output_dir="prod"

mkdir -p "$output_dir"

for sch in "${boards[@]}"; do
    if [ -f "$sch/production.kicad_jobset" ]; then
        kicad-cli jobset run \
            "$sch/$sch.kicad_pro" \
            -f "$sch/production.kicad_jobset"
        (cd production && zip -r "../${output_dir}/"${sch}"_prod.zip" .)
        rm -rf production
    else
        echo "Jobset for \"$sch\" not found!"
    fi
done
