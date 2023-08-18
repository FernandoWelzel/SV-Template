yosys read -sv $env(SOURCES_ALIB) $env(SOURCES_DESIGN)
yosys hierarchy -top $env(CONTROL_PATH_DECLARATION)
yosys show -format dot -viewer xdot $env(CONTROL_PATH_DECLARATION)
