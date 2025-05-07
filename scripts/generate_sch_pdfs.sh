#!/usr/bin/bash

schematics=(
    stm
    DAQ_dev_board
    power_systems
    "RF System"
    "Data Storage and Recovery Dev Circuit"
)

mkdir -p pdfs

for sch in "${schematics[@]}"; do
    kicad-cli sch export pdf \
        "$(find . -name "$sch.kicad_sch")" \
        --output "pdfs/$sch"
done
